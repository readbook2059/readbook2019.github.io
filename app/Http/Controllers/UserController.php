<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{
    //Funcao que cadastra Usuário
    public function store(Request $request)
    {
        $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8', 'confirmed']
        ]);

        $dados = $request->only(['name', 'email', 'password']);
        $dados['password'] = Hash::make($dados['password']);

        User::create($dados);

        return redirect()->route('login');
    }

    //Funcao que faz login
    public function login(Request $request)
    {
        $dados = $request->validate([
            'email' => ['required', 'email'],
            'password' => ['required']
        ]);

        //$admin = Admin::where('idUsuario', $dados->id)->get();

        if (Auth::attempt($dados, $request->filled('remember'))) {
            $request->session()->regenerate();
            return redirect()->intended('');
        }


        return back()->withErrors([
            'email' => 'O email e/ou senha não são invalidos'
        ]);
    }

    ///Funcao que sai da conta logada
    public function logout(Request $request)
    {
        Auth::logout();

        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect('/');
    }

    //Veriica se usuário logado é admin
    public function isAdmin(){            
        $user = auth()->user();

        if(auth()->check()){
            $admin = Admin::where('idUsuario', $user->id)->get();
            return count($admin);
        }

        return 0;
    }


    //Funcao para listar administradores
    public function listAdmin(){
        //listar usuário que são administrador
        $usuariosAdmin = User::join('admins', 'users.id', '=', 'admins.idUsuario')
            ->select('users.id', 'users.name', 'users.email', 'users.password')
            ->get();

        return view("admin.listar_admins", ['admins' => $usuariosAdmin]);
    }

    //Funcao para listar usuário que não são administradores
    public function listUser(){
        //listar usuário que não são administrador
        $usuariosNaoAdmin = User::whereNotIn('id', function ($query) {
            $query->select('idUsuario')->from('admins');
        })
        ->select('id', 'name', 'email', 'password')
        ->get();

        return view("admin.listar_usuarios", ['users' => $usuariosNaoAdmin]);
    }

    //apagar usuário
    public function deleteUser($id){
        try{
            $user = User::where('id', $id)->delete();
            return redirect('/consulta?exc=sucess');
            return $id;
        }catch(Exeption $e){
            return redirect('/consulta?exc=danger');
        }
    }


    //atualizar usuário
    public function update(Request $request){
        try{
            $user = auth()->user();
            $erro = 0;

            $request->validate([
                'name' => ['required', 'string', 'max:255'],
                'email' => ['required', 'string', 'email', 'max:255'],
                'password' => ['required', 'string', 'min:8', 'confirmed']
            ]);
    
            $dados = $request->only(['name', 'email', 'password']);
            $dados['password'] = Hash::make($dados['password']);
    
            User::where('id', $request->id)->update($dados);
            
            return view("conta.conta", ['user' => $user, 'erro' => $erro]);
        
        }
        catch(Exeption $e){
            $erro = 1;
            return view("conta.conta", ['livro' => $livro, 'erro' => $erro]);
        }
    }
}
