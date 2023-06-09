<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\LivroController;
use App\Http\Controllers\NavigationController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Hash;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

//rota principal
Route::get('/', [NavigationController::class, 'index'])->name('home');
Route::get('/page-not-found', [NavigationController::class, 'pageNotFound'])->name('notFound');
// Route::get('/', function () {return 'OLA';});

//CASO O USUARIO ESTEJA LOGADO
Route::group(['middleware' => 'auth'], function () {
    Route::get('/criar', [NavigationController::class, 'criarLivro']); //rota para criar livro
    Route::get('/conta', [NavigationController::class, 'conta']); //rota para visualizar conta
    Route::get('/livros', [LivroController::class, 'listarLivros'])->name("livros"); //ver todos os livros da conta
    Route::get('/editar/{id}', [LivroController::class, 'editar']); //rota para editar livro
    Route::get('/excluir/{id}', [LivroController::class, 'delete']); //rota para excluir livro

    Route::get('/livro', [LivroController::class, 'consultarLivro']); //ver informações de um livro escolhido
    Route::get('/pesquisa', [LivroController::class, 'pesquisarLivro']); //pesquisar livro

    Route::post('/create', [LivroController::class, 'createLivro'])->name('create'); //funcao para criar livro
    Route::post('/createDois', [LivroController::class, 'createLivroDois']); //funcao para criar livro
    Route::post('/update', [LivroController::class, 'update']); //funcao para editar livro

    Route::get('/logout', [UserController::class, 'logout']);//funcao para visualizar conta
    Route::post('/update-user', [UserController::class, 'update'])->name('update_user');//funcao para editar conta
    Route::get('/delete/user/{id}', [UserController::class, 'deleteUser']); //funcao para visualizar conta
    
    Route::get('/users', [UserController::class, 'listUser']); //funcao para listar administrador
    Route::get('/admins', [UserController::class, 'listAdmin']); //funcao para listar usuario
});


//CASO O USUARIO NÃO ESTEJA LOGADO
Route::group(['middleware' => 'guest'], function () {
    Route::get('/login', [NavigationController::class, 'login'])->name("login"); //tela de login
    Route::post('/login', [UserController::class, 'login']); //funcao de login

    Route::get('/register', [NavigationController::class, 'register'])->name("register"); //tela de cadastro
    Route::post('/register', [UserController::class, 'store']); //funcao de cadastro
});