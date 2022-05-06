<?php

namespace App\Controllers;

class Home extends BaseController
{
    public function index()
    {
        if(!isset($_SESSION['Rol'])){
            $tituloPagina['TituloPagina'] = "Not Logged";
            $datos['headerError'] = view('templates/HeaderNotLogged',$tituloPagina);
            return view('/errors/error',$datos);
        }
        else{
            $tituloPagina['TituloPagina'] = "Home";
            $datos['header'] = view('templates/Header',$tituloPagina);
            return view('PacientesViews/index',$datos);
        }
    }
}
