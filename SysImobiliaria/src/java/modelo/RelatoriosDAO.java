package modelo;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

public class RelatoriosDAO extends DataBaseDAO {

    public RelatoriosDAO() throws Exception {
    }

    // Método para inserir uma venda no banco de dados
    public void inserir(Relatorios relatorio) throws Exception {
        try {

            PreparedStatement pst;

            String sql = "INSERT INTO relatorios (custos,comissao,valorVenda,parceria,idCorretor,idComprador,dataFinal,visitas,telefonemas,idImovel,propostas,status) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
            pst = conn.prepareStatement(sql);

            Date sqlDataFinal = null;
            if (relatorio.getDataFinal() != null) {
                sqlDataFinal = Date.valueOf(relatorio.getDataFinal());
            }

            pst.setDouble(1, relatorio.getCustos());
            pst.setDouble(2, relatorio.getComissao());
            pst.setDouble(3, relatorio.getValorVenda());
            pst.setBoolean(4, relatorio.isParceria());
            pst.setInt(5, relatorio.getCorretor().getIdCorretor());

            pst.setInt(6, relatorio.getComprador().getIdComprador());

            pst.setDate(7, sqlDataFinal);
            pst.setInt(8, relatorio.getVisitas());
            pst.setInt(9, relatorio.getTelefonemas());
            pst.setInt(10, relatorio.getImovel().getIdImovel());
            pst.setInt(11, relatorio.getPropostas());
            pst.setBoolean(12, relatorio.isStatus());

            pst.execute();
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("Erro durante a alteração da relatório: " + e.getMessage());
        }
    }

    public void alterar(Relatorios relatorio) throws Exception {

        PreparedStatement pst;
        String sql = "UPDATE relatorios SET custos=?,comissao=?,valorVenda=?,parceria=?,idCorretor=?,idComprador=?,dataFinal=?,visitas=?,telefonemas=?,idImovel=?,propostas=?,status=? WHERE idRelatorio=?";
        pst = conn.prepareStatement(sql);

        DateTimeFormatter formatada = DateTimeFormatter.ofPattern("dd/MM/yyyy");

        Date sqlDataFinal = null;
        if (relatorio.getDataFinal() != null) {
            sqlDataFinal = Date.valueOf(relatorio.getDataFinal());
        }

        pst.setDouble(1, relatorio.getCustos());
        pst.setDouble(2, relatorio.getComissao());
        pst.setDouble(3, relatorio.getValorVenda());
        pst.setBoolean(4, relatorio.isParceria());
        pst.setInt(5, relatorio.getCorretor().getIdCorretor());

        pst.setInt(6, relatorio.getComprador().getIdComprador());

        pst.setDate(7, sqlDataFinal);
        pst.setInt(8, relatorio.getVisitas());
        pst.setInt(9, relatorio.getTelefonemas());
        pst.setInt(10, relatorio.getImovel().getIdImovel());

        pst.setInt(11, relatorio.getPropostas());
        pst.setBoolean(12, relatorio.isStatus());
        pst.setInt(13, relatorio.getIdRelatorio());

        pst.execute();

    }

    public void excluir(Relatorios relatorio) throws Exception {
        Statement stm;
        stm = conn.createStatement();
        String sql = "DELETE FROM relatorios WHERE idRelatorio =" + relatorio.getIdRelatorio();
        stm.execute(sql);

    }

    public List<Relatorios> listarRelatorios() throws Exception {
        List<Relatorios> listaRelatorios = new ArrayList<>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM relatorios";
        pst = conn.prepareStatement(sql);
        rs = pst.executeQuery();

        while (rs.next()) {
            Relatorios relatorio = new Relatorios();
            relatorio.setIdRelatorio(rs.getInt("idRelatorio"));
            relatorio.setCustos(rs.getDouble("custos"));
            relatorio.setComissao(rs.getDouble("comissao"));
            relatorio.setValorVenda(rs.getDouble("valorVenda"));
            relatorio.setParceria(rs.getBoolean("parceria"));
            relatorio.setStatus(rs.getBoolean("status"));
            relatorio.getImovel().setIdImovel(rs.getInt("idImovel"));
            relatorio.getCorretor().setIdCorretor(rs.getInt("idCorretor"));

            relatorio.getComprador().setIdComprador(rs.getInt("idComprador"));

            Date dataFinalDB = rs.getDate("dataFinal");
            relatorio.setDataFinal(dataFinalDB != null ? dataFinalDB.toLocalDate() : null);

            relatorio.setPropostas(rs.getInt("propostas"));
            relatorio.setTelefonemas(rs.getInt("telefonemas"));
            relatorio.setVisitas(rs.getInt("visitas"));

            listaRelatorios.add(relatorio);

        }

        return listaRelatorios;
    }

    public Relatorios carregarPorID(int idRelatorio) throws Exception {
        Statement stm;
        ResultSet rs;
        Relatorios relatorio = new Relatorios();
        stm = conn.createStatement();
        String sql = "SELECT * FROM relatorios WHERE idRelatorio =" + idRelatorio;
        rs = stm.executeQuery(sql);
        if (rs.next()) {

            relatorio.setIdRelatorio(rs.getInt("idRelatorio"));
            relatorio.getImovel().setIdImovel(rs.getInt("idImovel"));
            relatorio.setCustos(rs.getDouble("custos"));
            relatorio.setComissao(rs.getDouble("comissao"));
            relatorio.setValorVenda(rs.getDouble("valorVenda"));
            relatorio.setParceria(rs.getBoolean("parceria"));
            relatorio.getCorretor().setIdCorretor(rs.getInt("idCorretor"));

            relatorio.getComprador().setIdComprador(rs.getInt("idComprador"));
            relatorio.setStatus(rs.getBoolean("status"));
            Date dataFinalDB = rs.getDate("dataFinal");
            relatorio.setDataFinal(dataFinalDB != null ? dataFinalDB.toLocalDate() : null);

            relatorio.setPropostas(rs.getInt("propostas"));
            relatorio.setTelefonemas(rs.getInt("telefonemas"));
            relatorio.setVisitas(rs.getInt("visitas"));

        }
        return relatorio;
    }

    public List<Relatorios> listarRelatoriosPorProprietario(int idProprietario) throws Exception {
        List<Relatorios> listaRelatorios = new ArrayList<>();
        PreparedStatement pst;
        ResultSet rs;

        // Modifique a consulta SQL para incluir uma cláusula WHERE que filtre pelo idProprietario
        String sql = "SELECT * FROM relatorios WHERE idProprietario = ?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, idProprietario);

        rs = pst.executeQuery();

        while (rs.next()) {
            Relatorios relatorio = new Relatorios();
            relatorio.setIdRelatorio(rs.getInt("idRelatorio"));
            relatorio.setCustos(rs.getDouble("custos"));
            relatorio.setComissao(rs.getDouble("comissao"));
            relatorio.setValorVenda(rs.getDouble("valorVenda"));
            relatorio.setParceria(rs.getBoolean("parceria"));
            relatorio.setStatus(rs.getBoolean("status"));
            relatorio.getImovel().setIdImovel(rs.getInt("idImovel"));
            relatorio.getCorretor().setIdCorretor(rs.getInt("idCorretor"));

            relatorio.getComprador().setIdComprador(rs.getInt("idComprador"));

            relatorio.setDataFinal(rs.getDate("dataFinal").toLocalDate());
            relatorio.setTelefonemas(rs.getInt("telefonemas"));
            relatorio.setPropostas(rs.getInt("propostas"));
            relatorio.setVisitas(rs.getInt("visitas"));

            listaRelatorios.add(relatorio);
        }

        return listaRelatorios;
    }

    public void ContadorRelatorios(Relatorios relatorio) throws Exception {
        PreparedStatement pst;
        String sql = "UPDATE relatorios SET visitas=?,telefonemas=?,propostas=? WHERE idRelatorio=?";
        pst = conn.prepareStatement(sql);

        pst.setInt(1, relatorio.getVisitas());
        pst.setInt(2, relatorio.getTelefonemas());
        pst.setInt(3, relatorio.getPropostas());
        pst.setInt(4, relatorio.getIdRelatorio());

        pst.execute();
    }

    // Método para calcular a diferença em dias entre a data inicial e a data final de um relatório
    public long calcularDiferencaEmDias(Relatorios relatorio) {
        try {
            ImoveisDAO imoveisDAO = new ImoveisDAO();
            imoveisDAO.conectar();

            Imoveis imovel = imoveisDAO.carregarPorId(relatorio.getImovel().getIdImovel());

            LocalDate dataInicial = imovel.getDataInicial();
            LocalDate dataFinal = relatorio.getDataFinal();

            imoveisDAO.desconectar();

            if (dataInicial != null && dataFinal != null) {
                return ChronoUnit.DAYS.between(dataInicial, dataFinal);
            } else {
                return -1; // Valor de retorno para indicar que as datas não estão definidas
            }
        } catch (Exception e) {
            e.printStackTrace();
            return -1; // Em caso de erro, também retornamos -1
        }
    }

    public String obterTipoVenda(Relatorios relatorio) {
        if (relatorio.isParceria()) {
            return "Venda com parceria";
        } else {
            return "Venda sem parceria";
        }
    }

    public String calcularComissao(Relatorios relatorio) {
        double valorComissao;
        if (relatorio.isParceria()) {
            valorComissao = (relatorio.getValorVenda() * relatorio.getComissao() / 100) / 2;
        } else {
            valorComissao = relatorio.getValorVenda() * relatorio.getComissao() / 100;
        }
        return "R$" + valorComissao;
    }

    public String calcularLucro(Relatorios relatorio) {
        double valorLucro;
        if (relatorio.isParceria()) {
            valorLucro = ((relatorio.getValorVenda() * relatorio.getComissao() / 100) / 2) - relatorio.getCustos();
        } else {
            valorLucro = (relatorio.getValorVenda() * relatorio.getComissao() / 100) - relatorio.getCustos();
        }
        return "R$" + valorLucro;
    }

}
