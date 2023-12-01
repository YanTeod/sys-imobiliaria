package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class CorretorDAO extends DataBaseDAO {

    public CorretorDAO() throws Exception {
    }

    public void inserir(Corretor corretor) throws Exception {
        PreparedStatement pst;
        String sql = "INSERT INTO corretor (idPerfil, nomeCorretor, login, senha, status) VALUES(?, ?, ?, md5(?), ?)";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, corretor.getIdPerfil());
        pst.setString(2, corretor.getNomeCorretor());
        pst.setString(3, corretor.getLogin());
        pst.setString(4, corretor.getSenha());
        pst.setString(5, corretor.getStatus());
        pst.execute();
    }

    public ArrayList<Corretor> listar() throws Exception {
        ArrayList<Corretor> lista = new ArrayList<Corretor>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM corretor";
        pst = conn.prepareStatement(sql);
        rs = pst.executeQuery();
        while (rs.next()) {
            Corretor c = new Corretor();
            PerfilDAO pDB = new PerfilDAO();
            Perfil p = new Perfil();
            c.setIdCorretor(rs.getInt("idCorretor"));
            c.setNomeCorretor(rs.getString("nomeCorretor"));
            c.setLogin(rs.getString("login"));
            c.setSenha(rs.getString("senha"));
            c.setStatus(rs.getString("status"));
            c.setIdPerfil(rs.getInt("idPerfil"));
            c.setStatus(rs.getString("status"));

            pDB.conectar();
            p = pDB.carregaPorId(c.getIdPerfil());
            pDB.desconectar();
            c.setPerfil(p);

            lista.add(c);
        }

        return lista;

    }

    public void excluir(Corretor corretor) throws Exception {
        PreparedStatement pst;
        String sql = "DELETE FROM corretor WHERE idCorretor=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, corretor.getIdCorretor());
        pst.execute();
    }

    public void alterar(Corretor corretor) throws Exception {
        PreparedStatement pst;
        String sql = "UPDATE corretor SET idPerfil=?,nomeCorretor=?,login=?,senha=md5(?),status=? WHERE idCorretor=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, corretor.getIdPerfil());
        pst.setString(2, corretor.getNomeCorretor());
        pst.setString(3, corretor.getLogin());
        pst.setString(4, corretor.getSenha());
        pst.setString(5, corretor.getStatus());
        pst.setInt(6, corretor.getIdCorretor());

        pst.execute();
    }

    public Corretor carregaPorId(int idCorretor) throws Exception {
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM corretor WHERE idCorretor=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, idCorretor);
        rs = pst.executeQuery();
        Corretor c = new Corretor();
        if (rs.next()) {
            c.setIdCorretor(rs.getInt("idCorretor"));
            c.setIdPerfil(rs.getInt("idPerfil"));
            c.setLogin(rs.getString("login"));
            c.setNomeCorretor(rs.getString("nomeCorretor"));
            c.setSenha(rs.getString("senha"));
            c.setStatus(rs.getString("status"));
            PerfilDAO pDB = new PerfilDAO();
            Perfil p = new Perfil();
            pDB.conectar();
            p = pDB.carregaPorId(c.getIdPerfil());
            pDB.desconectar();
            c.setPerfil(p);
        }
        return c;
    }

    public Corretor logar(String login, String senha) throws Exception {
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM corretor WHERE login=? and senha=md5(?)";
        pst = conn.prepareStatement(sql);
        pst.setString(1, login);
        pst.setString(2, senha);

        rs = pst.executeQuery();
        Corretor c = new Corretor();
        if (rs.next()) {

            c.setIdCorretor(rs.getInt("idCorretor"));
            c.setIdPerfil(rs.getInt("idPerfil"));
            c.setLogin(rs.getString("login"));
            c.setNomeCorretor(rs.getString("nomeCorretor"));
            c.setSenha(rs.getString("senha"));
            c.setStatus(rs.getString("status"));

            PerfilDAO pDB = new PerfilDAO();
            pDB.conectar();
            Perfil p = pDB.carregaPorId(c.getIdPerfil());
            pDB.desconectar();

            c.setPerfil(p);

        }
        return c;
    }
}
