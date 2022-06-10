/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package crud;

import bd.conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import modelo.usuario;

/**
 * Classe : usuarioCRUD Criada em : 25 de mai. de 2022, 11:22:52 Funcionalidade
 * : Autor : Administrador
 */
public class usuarioCRUD {

    public Connection con;

    public usuarioCRUD() {
        con = conexao.conectar();
    }

    public void cadastra(usuario usu) {
        try {
            PreparedStatement psUsuario = con.prepareStatement("insert into usuario(nome,senha,nivel) values(?,?,?)");
            psUsuario.setString(1, usu.getNome());
            psUsuario.setString(2, usu.getSenha());
            psUsuario.setInt(3, usu.getNivel());
            psUsuario.executeUpdate();

            System.out.println("PASSOU PELO CADASTRO DE USUÁRIO...");
            con.close();

        } catch (SQLException sqle) {
            //sqle.printStackTrace();
            System.out.println("Classe usuarioCrud - cadastra() - SQLException");
        }
    }

    public boolean verificaUsuario(String usuario, String senha) {
        boolean verificado = false;
        try {
            PreparedStatement psUsuario = con.prepareStatement("select * from usuario where nome=? and senha=?");
            psUsuario.setString(1, usuario);
            psUsuario.setString(2, senha);
            ResultSet rsUsuario = psUsuario.executeQuery();
            System.out.println("PASSOU PELA VERIFICAÇÃO DE USUÁRIO...");
            while (rsUsuario.next()) {
                verificado = true;
                System.out.println("USUÁRIO CONFIRMADO..");
            }
            con.close();
        } catch (SQLException sqle) {
            System.out.println("Classe.: usuarioCRUD - verificaUsuario - SQLException   ");
        }
        return verificado;
    }
}
