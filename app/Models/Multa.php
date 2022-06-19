<?php 
namespace App\Models;

use CodeIgniter\Model;

class Multa extends Model{
    protected $table      = 'multa';
    // Uncomment below if you want add primary key
    protected $primaryKey = 'idMulta';
    protected $allowedFields =['idPaciente','NombrePaciente','ApellidoPaciente','VecesFaltadas','ValorMulta'];
    public function getMultas(){
        return $this->findAll();
    }
}