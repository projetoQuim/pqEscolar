/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controle;

import crud.alunoCRUD;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.DatatypeConverter;
import modelo.aluno;

/**
 * Classe : controleAluno Criada em : 14 de jun. de 2022, 08:40:26
 *
 * Funcionalidade : Autor : Administrador
 */
@WebServlet(name = "controleAluno", urlPatterns = {"/controleAluno"})
public class controleAluno extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            String aciona = request.getParameter("acao");
            alunoCRUD acaoAluno = new alunoCRUD();

            aluno alu = new aluno();
            alu.setId(request.getParameter("tfID"));
            alu.setRgra(request.getParameter("tfRGRA"));
            alu.setNome(request.getParameter("tfNome"));
            alu.setEndereco(request.getParameter("tfEndereco"));
            alu.setTelefone(request.getParameter("tfTelefone"));
            
            String foto = request.getParameter("foto");//Será convertido em arquivo

            String arquivo = foto.split(",")[1];
            String caminhoImagem = request.getServletContext().getRealPath("fotos") + File.separator;

            //TROCAR AS BARRAS "\" POR "/" POIS É COM A TAG IMG ABRE O CAMINHO....
            //DEU DOR DE CABEÇA POIS, QUANDO SE USA ALGUNS CARACTERES NESSA FUNÇÃO (REPLACEALL) ELA VERIFICA SE NÃO SE TRATA DE UM "REGEX(EXPRESSÃO REGULAR- TIPO "\n", QUE É PARA SALTAR PARA LINHA DE BAIXO )"
            //caminhoImagem = caminhoImagem.replaceAll("[\"]" , "/");
            
            byte[] btDataFile = DatatypeConverter.parseBase64Binary(arquivo);

            File of = new File(caminhoImagem+request.getParameter("tfID")+".png");
            try ( FileOutputStream osf = new FileOutputStream(of)) {
                osf.write(btDataFile);
                osf.flush();
                osf.close();// SE NÃO COLOCAR O CLOSE, ELE DEIXA O ARQUIVO ABERTO...
            }
            
            alu.setFoto(caminhoImagem+request.getParameter("tfID")+".png");
            
            out.println(aciona+"<br>");
            out.println(alu.getId()+"<br>");
            out.println(alu.getRgra()+"<br>");
            out.println(alu.getNome()+"<br>");
            out.println(alu.getEndereco()+"<br>");
            out.println(alu.getTelefone()+"<br>");
            out.println(foto+"<br>");
            out.println(caminhoImagem+"<br>");
            out.println(arquivo);
            
            acaoAluno.cadastra(alu);

//            if (aciona.equalsIgnoreCase("em_branco")) {
//                response.sendRedirect("Inicio.jsp");
//            } else if (aciona.equalsIgnoreCase("novo")) {
//                acaoAluno.cadastra(alu);
//                response.sendRedirect("Login.jsp");
//            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
