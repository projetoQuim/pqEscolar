/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


/**
 *  Classe criada em 18/05/2022
 *  Funcionalidade.: Estabelecer conexão com o banco de dados.
 * @author Administrador
 */
public class conexao {

    private static Connection conecta=null;
    
    public static Connection conectar(){
        try{
        Class.forName("com.mysql.jdbc.Driver");
        }catch(ClassNotFoundException cnfe){
            System.out.println("Classe dao.conexao - Class.forName - Classe não encontrada.");
        }
        try{
        conecta = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pqescolar","root","@19Twostars");
        }catch(SQLException sqle){
            System.out.println("Classe dao.conexao - DriverManager.getConnectio - Erro do SQL/Conexão.");
        }
        return conecta;
    }
    
}
