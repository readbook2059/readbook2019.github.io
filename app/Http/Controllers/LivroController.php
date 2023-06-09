<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Livro;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

class LivroController extends Controller
{

    // Lista todos os livros do usuario logado
    public function listarLivros(){
        $user = auth()->user(); //verifica qual usuario esta logado
        $livros = Livro::where('id_usuario', $user->id)->get(); //busca livro pelo usuario
        $quantidadeLivros = Livro::where('id_usuario', $user->id)->count();
        $quantidadeLivrosLidos = Livro::where('lido', 'sim')->where('id_usuario', $user->id)->count();

        return view("books.listar_livros", ['livros' => $livros, 'quantidadeLivros' => $quantidadeLivros, 'quantidadeLivrosLidos' => $quantidadeLivrosLidos]);
    }

    //busca livro pelo id
    public function consultarLivro(){
        $user = auth()->user(); //verifica qual usuario esta logado
        
        $livros = Livro::where('id_livro', $_GET['id'])
        ->where('id_usuario', $user->id )
        ->get();

        //caso tenha um livro cadastrado
        if(isset($livros) && $livros != "[]"){
            $livro = $livros[0]; 
            return view("books.consultar_livro", ['livro' => $livro]);
        }
        
        else{//caso tenha não um livro cadastrado
            return view("page_not_found");
        }
    }

    //pesquisa livro por nome
    public function pesquisarLivro(){
            $user = auth()->user();

            $livros = Livro::where('nome_livro', 'LIKE', "%" . $_GET['livro'] . "%")
            ->where('id_usuario', $user->id )
            ->get();
            return view("books.pesquisar_livro", ['livros' => $livros]);
    }

    //cadastra livro
    //verifica se há um livro com o nome na API de livros da Google para preecher autotatico
    public function createLivro(Request $request){
        $dados = $request->validate([
            'nome1' => ['required', 'string']
        ]);

        $book_title = $request->nome1; // insira aqui o título do livro que você está procurando
        $book_name = "";
        $descricao = "";
        $url_capa = "";
        $page_count = "";

        // Codifica o título do livro para ser usado como parâmetro na URL da API
        $book_title_encoded = urlencode($book_title);
        
        // Faz a requisição HTTP para a API do Google Books e obtém os dados do livro em formato JSON
        $url = 'https://www.googleapis.com/books/v1/volumes?q=' . $book_title_encoded;
        $json_data = file_get_contents($url);
        
        // Decodifica os dados JSON em um objeto PHP e obtém a URL da imagem da capa do primeiro livro encontrado (se houver)
        $data = json_decode($json_data);

        if (isset($data->items[0]->volumeInfo->imageLinks)) {
            $book = $data->items[0]->volumeInfo;
            if(isset($book->imageLinks->smallThumbnail)){
                $url_capa = $book->imageLinks->smallThumbnail;
            }else{
                $url_capa = "";
            }

            if(isset($book->title)){
                $book_name = $book->title;
            }else{
                $book_name = $request->nome1;
            }

            if(isset($book->description)){
                $descricao = $book->description;
            }else{
                $descricao = "";
            }

            if(isset($book->pageCount)){
                $page_count = $book->pageCount;
            }else{
                $page_count = "";
            }

            #$book_name = $data->items[0]->
        // Exibe a URL da imagem da cap
            return view("books.criar_livro", ['dados_livro' => $json_data, 'book_name' => $book_name, 'url_capa' => $url_capa, 'descricao' => $descricao, 'page_count' => $page_count]);
        } else {
            // Caso não haja imagem de capa disponível
            return view("books.criar_livro", ['dados_livro' => $json_data, 'book_name' => $book_title, "nome_livro" => $book_title, 'url_capa' => $url_capa, 'descricao' => $descricao, 'page_count' => $page_count]);
        }
    }

    //salva livro no banco
    public function createLivroDois(Request $request){
        $user = auth()->user();
        try{
            $dados = $request->validate([
                'nome_livro' => ['required', 'string'],
                'descricao_livro' => ['required', 'string']
            ]);

            $livro = new Livro;

            $livro->id_usuario = $user->id;
            $livro->img_livro = $request->img_livro;
            $livro->nome_livro = $request->nome_livro;
            $livro->descricao_livro = $request->descricao_livro;
            $livro->lido = "não";
            $livro->tempo_lido = "0 dias";
            $livro->paginas_lidas = 0;
            $livro->total_paginas = $request->pagina_total;
            $livro->data_inicio = $request->data_inicio;
            $livro->data_termino = $request->data_termino;
    
            $livro->save();
    
            return redirect('livros?cad=sucess');
        }
        catch(Exeption $e){
            return redirect('livros?cad=danger');
        }


        return back()->withErrors([
            'descricao_livro' => 'Invalido'
        ]);
    }


    //view para editar livro
    public function editar($id){
        $user = auth()->user(); //verifica qual usuario esta logado
        
        $livro = Livro::where('id_livro',  $id)
        ->where('id_usuario', $user->id )
        ->get()
        ->first(); 
        //return view("books.editar", ["livro" => $livro]);

        //caso tenha um livro cadastrado
        if(isset($livro) && $livro != "[]"){
            return view("books.editar", ["livro" => $livro]);
        }
        
        else{//caso tenha não um livro cadastrado
            return view("page_not_found");
        }
    }


    //funcao para editar livro
    public function update(Request $request){
        try{
            $erro = 0;
            Livro::where('id_livro', $request->id_livro)
                ->update([
                    'nome_livro' => $request->nome_livro,
                    'img_livro' => $request->img_livro,
                    'lido' => $request->lido,
                    'total_paginas' => $request->total_paginas,
                    'tempo_lido' => $request->tempo_lido,
                    'paginas_lidas' => $request->paginas_lidas,
                    'descricao_livro' => $request->descricao_livro,
                    'data_inicio' => $request->data_inicio,
                    'data_termino' => $request->data_termino,
                ]);


            
            $livros = Livro::where('id_livro', $request->id_livro)->get(); 
            $livro = $livros[0]; 
            return view("books.consultar_livro", ['livro' => $livro, 'erro' => $erro]);
        
        }
        catch(Exeption $e){
            $erro = 1;
            return view("books.consultar_livro", ['livro' => $livro, 'erro' => $erro]);
        }
    }

    //apaga livro
    public function delete($id){
        try{
            Livro::where('id_livro',  $id)->delete(); 
            return redirect('livros?exc=sucess');
        }
        catch(Exeption $e){
            return redirect('livros?exc=danger');
        }
    }
}