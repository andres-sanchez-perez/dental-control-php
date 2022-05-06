<?php 
namespace App\Controllers;

use CodeIgniter\Controller;
use App\Models\User;
class Users extends BaseController{

    public function index(){
        $tituloPagina['TituloPagina'] = "Iniciar Sesion";
        $datos['header'] =view('templates/HeaderNotLogged',$tituloPagina);
        $datos['error'] = null;
        return view('LoginViews/Login',$datos);
    }

    public function login(){
        $usuario = new User();
        $username = $this->request->getVar('username');
        $password = $this->request->getVar('password');
        $sql = "SELECT userId, username, Nombre, Apellido, correoElectronico, contrasenia, Rol 
        from user where contrasenia = ? and (username = ? or correoElectronico = ?)";
        $query = $usuario->db->query($sql,[$password,$username,$username]);
        $result = $query->getRowArray();
        if($result != null){
            $_SESSION['username']= $result['username'];
            $_SESSION['correoElectronico'] = $result['correoElectronico'];
            $_SESSION['Rol'] = $result['Rol'];
            return redirect()->to('/');
        }
        else{
            $tituloPagina['TituloPagina'] = "Iniciar Sesion";
            $datos['header'] = view('templates/HeaderNotLogged',$tituloPagina);
            $datos['error'] = "Contraseña o usuario incorrectos, compruebe sus credenciales";
            return view('LoginViews/Login',$datos);
        }
    }
    public function logOut(){
        session_destroy();
        return redirect()->to('/');
    }
}