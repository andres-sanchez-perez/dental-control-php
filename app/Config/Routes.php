<?php

namespace Config;

// Create a new instance of our RouteCollection class.
$routes = Services::routes();

// Load the system's routing file first, so that the app and ENVIRONMENT
// can override as needed.
if (file_exists(SYSTEMPATH . 'Config/Routes.php')) {
    require SYSTEMPATH . 'Config/Routes.php';
}

/*
 * --------------------------------------------------------------------
 * Router Setup
 * --------------------------------------------------------------------
 */
$routes->setDefaultNamespace('App\Controllers');
$routes->setDefaultController('Home');
$routes->setDefaultMethod('index');
$routes->setTranslateURIDashes(false);
$routes->set404Override();
$routes->setAutoRoute(true);

/*
 * --------------------------------------------------------------------
 * Route Definitions
 * --------------------------------------------------------------------
 */

// We get a performance increase by specifying the default
// route since we don't have to scan directories.
$routes->get('/', 'Home::index');

/*
 * --------------------------------------------------------------------
 * Additional Routing
 * --------------------------------------------------------------------
 *
 * There will often be times that you need additional routing and you
 * need it to be able to override any defaults in this file. Environment
 * based routes is one such time. require() additional route files here
 * to make that happen.
 *
 * You will have access to the $routes object within that file without
 * needing to reload it.
 */
if (file_exists(APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php')) {
    require APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php';
}

$routes->get('loginIndex', 'Users::index');
$routes->get('logout', 'Users::logOut');
$routes->get('verPacientes', 'Pacientes::index');
$routes->get('editarPaciente/(:num)', 'Pacientes::Editar/$1');
$routes->get('borrarPaciente/(:nun)', 'Pacientes::Borrar/$1');
$routes->get('verAntecedente/(:num)', 'Antecedentes::verAntecedente/$1');
$routes->get('agregarAntecedente/(:num)', 'Antecedentes::crearAntecedentes/$1');
$routes->post('registrarAntecedente', 'Antecedentes::RegistrarAntecedente');
$routes->get('borrarAntecedente/(:num)', 'Antecedentes::borrarAntecedente/$1');
$routes->get('registrarCirujia', 'Cirujias::registrarCirujia');
$routes->post('agregarCirujia', 'Cirujias::agregarCirujia');
$routes->get('verCirujias/(:num)', 'Cirujias::index/$1');
$routes->get('verTratamientos/(:num)', 'Tratamientos::verTratamientos/$1');
$routes->get('crearTratamiento', 'Tratamientos::crearTratamiento');
$routes->get('editarTratamiento/(:num)/(:num)', 'Tratamientos::editarTratamiento/$1/$2');
$routes->get('borrarTratamiento/(:num)/(:num)', 'Tratamiento::borrarTratamiento/$1/$2');
$routes->post('agregarTratamiento', 'Tratamientos::agregarTratamiento');
$routes->get('crearPaciente', 'Pacientes::crearPaciente');
$routes->post('nuevoPaciente', 'Pacientes::guardar');
$routes->post('actualizarPaciente', 'Pacientes::actualizarPaciente');
$routes->post('login', 'Users::login');
$routes->post('actualizarTratamiento', 'Tratamientos::actualizarTratamiento');