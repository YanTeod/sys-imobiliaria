package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;



public class CompradorDAO extends DataBaseDAO {

    public CompradorDAO() throws Exception {
    }
    
    public void inserir(Comprador comprador) throws Exception {
        PreparedStatement pst;
        String sql = "INSERT INTO comprador (nome,email,telefone,cpf,status) VALUES (?,?,?,?,?)";
        pst = conn.prepareStatement(sql);
        
        
        pst.setString(1, comprador.getNome());
        pst.setString(2, comprador.getEmail());
        pst.setString(3, comprador.getTelefone());
        pst.setString(4, comprador.getCpf());
        pst.setBoolean(5, true);
        
        pst.execute();
        
    }
    public ArrayList<Comprador> listar() throws Exception {
        ArrayList<Comprador> lista = new ArrayList<Comprador>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM comprador";
        pst = conn.prepareStatement(sql);
        rs = pst.executeQuery();
        while (rs.next()) {
            Comprador c = new Comprador();
            c.setIdComprador(rs.getInt("idComprador"));
            c.setNome(rs.getString("nome"));
            c.setEmail(rs.getString("email"));
            c.setCpf(rs.getString("cpf"));
            c.setTelefone(rs.getString("telefone"));
            c.setStatus(rs.getBoolean("status"));
            lista.add(c);
        }
        return lista;
    }
     public void excluir(Comprador comprador) throws Exception {
        Statement stm;
        stm = conn.createStatement();
        String sql = "DELETE FROM comprador WHERE idComprador=" + comprador.getIdComprador();

        stm.execute(sql);
    }
      public void alterar(Comprador comprador) throws Exception {
        PreparedStatement pst;
        String sql = "UPDATE comprador SET nome=?,email=?,cpf=?,telefone=?,status=? WHERE idComprador=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, comprador.getNome());
        pst.setString(2, comprador.getEmail());
        pst.setString(3, comprador.getCpf());
        pst.setString(4, comprador.getTelefone());
        pst.setBoolean(5, comprador.isStatus());
        pst.setInt(6, comprador.getIdComprador());

        pst.execute();
    }
       public Comprador carregarPorId(int id) throws Exception {
        Statement stm;
        ResultSet rs;
        Comprador comprador = new Comprador();
        stm = conn.createStatement();
        String sql = "SELECT * FROM comprador WHERE idComprador=" + id;
        rs = stm.executeQuery(sql);
        if (rs.next()) {
            comprador.setIdComprador(rs.getInt("idComprador"));
            comprador.setNome(rs.getString("nome"));
            comprador.setEmail(rs.getString("email"));
            comprador.setCpf(rs.getString("cpf"));
            comprador.setTelefone(rs.getString("telefone"));
            comprador.setStatus(rs.getBoolean("status"));

        }
        return comprador;
    }

}
