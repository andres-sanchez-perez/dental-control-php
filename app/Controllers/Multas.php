<?php 
namespace App\Controllers;

use App\Models\Cita;
use CodeIgniter\Controller;
use App\Models\Multa;
use App\Models\Paciente;
use PhpParser\Node\Expr\AssignOp\Mul;

class Multas extends Controller{


    const VALORMULTA = 5;

    public function index(){
        if(!Comprobadores::isLogged()){
            $tituloPagina['TituloPagina'] = "Not Logged";
            $datos['headerError'] = view('templates/HeaderNotLogged',$tituloPagina);
            return view('/errors/error',$datos);
        }
        else{
            $multas = new Multa();
            $tituloPagina['TituloPagina'] = "Ver Multas";
            $datos['header'] = view('templates/Header',$tituloPagina);
            $datos['Multas'] = $multas->getMultas();
            return view('Multas/verMultas',$datos);
        }
    }

    public static function calcularMultas($idPaciente,$idCita){
        $multas = new Multa();
        $pacientes = new Paciente();
        $citas = new Cita();
        $cita = $citas->where('id_cita',$idCita)->first();
        $sql = "SELECT idMulta, idPaciente,NombrePaciente,ApellidoPaciente,VecesFaltadas,ValorMulta from multa where idPaciente = ?";
        $query = $multas->db->query($sql,$idPaciente);
        $multa = $query->getRowArray();
        $paciente = $pacientes->where('id_paciente',$idPaciente)->first();
        if(!is_null($multa)){
            $multa['VecesFaltadas'] += 1;
            $multa['ValorMulta'] = self::VALORMULTA*$multa['VecesFaltadas'];
            $multas->update($multa['idMulta'],$multa);
            $cita->HayQueMultar = false;
            $cita->CitaMultada = true;
            $citas->update($cita->id_cita,$cita);
        }
        else{
            $data =[
                'idPaciente' => $paciente->id_paciente,
                'NombrePaciente' => $paciente->Nombre,
                'ApellidoPaciente' => $paciente->Apellido,
                'VecesFaltadas' => 1,
                'ValorMulta' => self::VALORMULTA
            ];
            $multas->insert($data);
            $cita->HayQueMultar = false;
            $cita->CitaMultada = true;
            $citas->update($cita->id_cita,$cita);
        }
    }
}