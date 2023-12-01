package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class ProprietarioDAO extends DataBaseDAO {

    public ProprietarioDAO() throws Exception {
    }

    public void inserir(Proprietario proprietario) throws Exception {
        PreparedStatement pst;
        String sql = "INSERT INTO proprietario (nome,email,cpf,telefone,status) VALUES (?,?,?,?,?)";
        pst = conn.prepareStatement(sql);

        pst.setString(1, proprietario.getNome());
        pst.setString(2, proprietario.getEmail());
        pst.setString(3, proprietario.getCpf());
        pst.setString(4, proprietario.getTelefone());
        pst.setBoolean(5, true);

        pst.execute();
    }

    public ArrayList<Proprietario> listar() throws Exception {
        ArrayList<Proprietario> lista = new ArrayList<Proprietario>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM proprietario";
        pst = conn.prepareStatement(sql);
        rs = pst.executeQuery();
        while (rs.next()) {
            Proprietario p = new Proprietario();
            p.setIdProprietario(rs.getInt("idProprietario"));
            p.setNome(rs.getString("nome"));
            p.setEmail(rs.getString("email"));
            p.setCpf(rs.getString("cpf"));
            p.setTelefone(rs.getString("telefone"));
            p.setStatus(rs.getBoolean("status"));
            lista.add(p);
        }
        return lista;
    }

    public void excluir(Proprietario proprietario) throws Exception {
        Statement stm;
        stm = conn.createStatement();
        String sql = "DELETE FROM proprietario WHERE idProprietario=" + proprietario.getIdProprietario();

        stm.execute(sql);
    }

    public void alterar(Proprietario proprietario) throws Exception {
        PreparedStatement pst;
        String sql = "UPDATE proprietario SET nome=?,email=?,cpf=?,telefone=?,status=? WHERE idProprietario=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, proprietario.getNome());
        pst.setString(2, proprietario.getEmail());
        pst.setString(3, proprietario.getCpf());
        pst.setString(4, proprietario.getTelefone());
        pst.setInt(5, proprietario.getIdProprietario());
        pst.setBoolean(6, proprietario.isStatus());

        pst.execute();
    }

    public Proprietario carregarPorId(int id) throws Exception {
        Statement stm;
        ResultSet rs;
        Proprietario proprietario = new Proprietario();
        stm = conn.createStatement();
        String sql = "SELECT * FROM proprietario WHERE idProprietario=" + id;
        rs = stm.executeQuery(sql);
        if (rs.next()) {
            proprietario.setIdProprietario(rs.getInt("idProprietario"));
            proprietario.setNome(rs.getString("nome"));
            proprietario.setEmail(rs.getString("email"));
            proprietario.setCpf(rs.getString("cpf"));
            proprietario.setTelefone(rs.getString("telefone"));
            proprietario.setStatus(rs.getBoolean("status"));

        }
        return proprietario;
    }

}
