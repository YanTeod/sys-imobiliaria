/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.ResultSet;
import java.sql.Statement;


/**
 *
 * @author LEF-300
 */
public class TesteDAO extends DataBaseDAO {

    public TesteDAO() throws Exception {
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
        
        // Criação do objeto Proprietario
        Proprietario proprietario = new Proprietario();
        proprietario.setIdProprietario(rs.getInt("idProprietario"));
        imovel.setProprietario(proprietario);

        imovel.setDataInicial((rs.getDate("dataInicial").toLocalDate()));
        imovel.setVagasGaragem(rs.getInt("vagasGaragem"));
    }
    return imovel;
}
}
