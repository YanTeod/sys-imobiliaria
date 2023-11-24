package modelo;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;

public class ImoveisDAO extends DataBaseDAO {

    public ImoveisDAO() throws Exception {
    }

    public void inserir(Imoveis imovel) throws Exception {
        PreparedStatement pst;
        //idImovel	tipo	precoM2	localizacao	areaUtil	areaTotal	comodos	vagasGaragem	status	idProprietario	

        String sql = "INSERT INTO imoveis (tipo,precoM2,localizacao,areaUtil,areaTotal,comodos,vagasGaragem,status,idProprietario,dataInicial) VALUES(?,?,?,?,?,?,?,?,?,?)";
        pst = conn.prepareStatement(sql);

        LocalDate dataAtual = LocalDate.now(); // Obtém a data atual
        Date sqlDataInicial = Date.valueOf(dataAtual);

        pst.setString(1, imovel.getTipo());
        pst.setDouble(2, imovel.getPrecoM2());
        pst.setString(3, imovel.getLocalizacao());
        pst.setDouble(4, imovel.getAreaUtil());
        pst.setDouble(5, imovel.getAreaTotal());
        pst.setInt(6, imovel.getComodos());
        pst.setInt(7, imovel.getVagasGaragem());
        pst.setString(8, imovel.getStatus());
        pst.setInt(9, imovel.getProprietario().getIdProprietario());
        pst.setDate(10, sqlDataInicial);

        pst.execute();

    }

    public ArrayList<Imoveis> listar() throws Exception {
        ArrayList<Imoveis> lista = new ArrayList<Imoveis>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM imoveis";
        pst = conn.prepareStatement(sql);
        rs = pst.executeQuery();
        while (rs.next()) {
            Imoveis i = new Imoveis();
            i.setIdImovel(rs.getInt("idImovel"));
            i.setTipo(rs.getString("tipo"));
            i.setPrecoM2(rs.getDouble("precoM2"));
            i.setLocalizacao(rs.getString("localizacao"));
            i.setAreaUtil(rs.getDouble("areaUtil"));
            i.setAreaTotal(rs.getDouble("areaTotal"));
            i.setComodos(rs.getInt("comodos"));
            i.getProprietario().setIdProprietario(rs.getInt("idProprietario"));
            i.setVagasGaragem(rs.getInt("vagasGaragem"));
            i.setStatus(rs.getString("status"));
            lista.add(i);
        }
        return lista;
    }

    public void excluir(Imoveis imoveis) throws Exception {
        Statement stm;
        stm = conn.createStatement();
        String sql = "DELETE FROM imoveis WHERE idImovel=" + imoveis.getIdImovel();
        stm.execute(sql);
    }

    public void alterar(Imoveis imovel) throws Exception {
        PreparedStatement pst;
        String sql = "UPDATE imoveis SET tipo=?,precoM2=?,localizacao=?,areaUtil=?,areaTotal=?,comodos=?,idProprietario=?,vagasGaragem=?,status=? WHERE idImovel=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, imovel.getTipo());
        pst.setDouble(2, imovel.getPrecoM2());
        pst.setString(3, imovel.getLocalizacao());
        pst.setDouble(4, imovel.getAreaUtil());
        pst.setDouble(5, imovel.getAreaTotal());
        pst.setInt(6, imovel.getComodos());
        pst.setInt(7, imovel.getProprietario().getIdProprietario());
        pst.setInt(8, imovel.getVagasGaragem());
        pst.setString(9, imovel.getStatus());
        pst.setInt(10, imovel.getIdImovel());

        pst.execute();
    }

    public Imoveis carregarPorId(int id) throws Exception {
        Statement stm;
        ResultSet rs;
        Imoveis imovel = new Imoveis();
        stm = conn.createStatement();
        String sql = "SELECT * FROM imoveis WHERE idImovel=" + id;
        rs = stm.executeQuery(sql);
        if (rs.next()) {
            imovel.setIdImovel(rs.getInt("idImovel"));
            imovel.setTipo(rs.getString("tipo"));
            imovel.setPrecoM2(rs.getDouble("precoM2"));
            imovel.setLocalizacao(rs.getString("localizacao"));
            imovel.setAreaUtil(rs.getDouble("areaUtil"));
            imovel.setAreaTotal(rs.getDouble("areaTotal"));
            imovel.setComodos(rs.getInt("comodos"));
            imovel.getProprietario().setIdProprietario(rs.getInt("idProprietario"));
            imovel.setDataInicial((rs.getDate("dataInicial").toLocalDate()));
            imovel.setVagasGaragem(rs.getInt("vagasGaragem"));

        }
        return imovel;
    }
}
