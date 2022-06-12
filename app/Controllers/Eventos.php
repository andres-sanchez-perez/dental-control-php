<?php 
namespace App\Controllers;

use CodeIgniter\Controller;
use App\Models\Evento;
use Symfony\Contracts\EventDispatcher\Event;

class Eventos extends BaseController{

    public function show($id = null){
        if($_SESSION['Rol'] == "Doctor"){
            $eventos = new Evento();
            $sql = "SELECT * from evento where id_doctor = ?";
            $query = $eventos->db->query($sql,$_SESSION['id_doctor']);
            $evento = $query->getResultArray();
            return json_encode($evento);
        }
        else{

            if(isset($_POST["id"])){
                $id = $_POST["id"];
            }
            else{
                $id = "0";
            }
            
            if($id == null){
                $eventos = new Evento();
                $evento = $eventos->getEventos();
                $data['citas'] = $evento;
                return json_encode($data);
            }else{
                $eventos = new Evento();
                $sql = "SELECT * from evento where id_doctor = ?";
                $query = $eventos->db->query($sql,$id);
                $evento = $query->getResultArray();
                if(sizeof($evento)>0){
                    $data['citas'] = $evento;
                }
                else{
                    $data['citas'] = null;
                }
                return json_encode($data);
            }
        }
    }
    public function find($id = null){
        $eventos = new Evento();
        $id = $_POST['id'];
        $sql = $sql = "SELECT * from evento where id = ?";
        $query = $eventos->db->query($sql,$id);
        $evento = $query->getRowArray();
        $data['citas'] = $evento;
        return json_encode($data);
    }
}