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
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import modelo.aluno;

/**
 * Classe : alunoCRUD Criada em : 14 de jun. de 2022, 09:47:07 Funcionalidade :
 * Autor : Administrador
 */
public class alunoCRUD {

    public Connection con;

    public alunoCRUD() {
        con = conexao.conectar();
    }

    public void cadastra(aluno alu) {
        try {
            PreparedStatement psAluno = con.prepareStatement("insert into aluno(idAluno, RGRA,nome,endereco,telefone,foto) values(?,?,?,?,?,?)");
            psAluno.setString(1, alu.getId());
            psAluno.setString(2, alu.getRgra());
            psAluno.setString(3, alu.getNome());
            psAluno.setString(4, alu.getEndereco());
            psAluno.setString(5, alu.getTelefone());
            psAluno.setString(6, alu.getFoto());

            psAluno.executeUpdate();

            System.out.println("PASSOU PELO CADASTRO DE ALUNO...");
            con.close();

        } catch (SQLException sqle) {
            System.out.println("Classe alunoCrud - cadastra() - SQLException");

        }
    }

    public List<aluno> listaAlunos() {
        List<aluno> listaDeAlunos = new ArrayList<aluno>();
        try {
            Statement stmt = con.createStatement();
            ResultSet rsAluno = stmt.executeQuery("select * from aluno");
            while (rsAluno.next()) {
                aluno alu = new aluno();
                alu.setRm(rsAluno.getInt("RM"));
                alu.setId(rsAluno.getString("idAluno"));
                alu.setRgra(rsAluno.getString("RGRA"));
                alu.setNome(rsAluno.getString("NOME"));
                alu.setEndereco(rsAluno.getString("ENDERECO"));
                alu.setTelefone(rsAluno.getString("TELEFONE"));
                alu.setFoto(rsAluno.getString("FOTO"));

                listaDeAlunos.add(alu);
            }
            con.close();
        } catch (SQLException e) {
            System.out.println("Classe alunoCrud - listaAlunos() - SQLException");
        }
        return listaDeAlunos;
    }

    public void deletaAluno(int rm) {
        try {
            PreparedStatement psAluno = con.prepareStatement("delete from aluno where RM=?");
            psAluno.setInt(1, rm);
            psAluno.executeUpdate();
            con.close();

        } catch (SQLException sqle) {
            System.out.println("Classe alunoCrud - deletaAluno() - SQLException");
        }
    }

    public aluno retornaAluno(int RM) {
        aluno alu = new aluno();
        try {
            PreparedStatement psAluno = con.prepareStatement("select * from aluno where RM=?");
            psAluno.setInt(1, RM);
            ResultSet rsAluno = psAluno.executeQuery();
            if (rsAluno.next()) {
                alu.setRm(rsAluno.getInt("RM"));
                alu.setId(rsAluno.getString("idAluno"));
                alu.setRgra(rsAluno.getString("RGRA"));
                alu.setNome(rsAluno.getString("NOME"));
                alu.setEndereco(rsAluno.getString("ENDERECO"));
                alu.setTelefone(rsAluno.getString("TELEFONE"));
                alu.setFoto(rsAluno.getString("FOTO"));
            }
            con.close();
        } catch (SQLException sqle) {
            System.out.println("Classe alunoCrud - retornaAluno() - SQLException");
        }
        System.out.println("PASSOU PELO RETORNA ALUNO");
        return alu;
    }

    public void atualizaAluno(aluno alu) {
        try {
            PreparedStatement psAluno = con.prepareStatement("update aluno set idAluno=?, RGRA=?, NOME=?, ENDERECO=?, TELEFONE=?, FOTO=? where RM=?");
            psAluno.setString(1, alu.getId());
            psAluno.setString(2, alu.getRgra());
            psAluno.setString(3, alu.getNome());
            psAluno.setString(4, alu.getEndereco());
            psAluno.setString(5, alu.getTelefone());
            psAluno.setString(6, alu.getFoto());
            psAluno.setInt(7, alu.getRm());

            psAluno.executeUpdate();
            con.close();
        } catch (SQLException sqle) {
            System.out.println("Classe alunoCrud - atualizaAluno() - SQLException");
        }
        System.out.println("PASSOU PELO ATUALIZA ALUNO");
    }
}
