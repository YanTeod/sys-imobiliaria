package modelo;

import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import lombok.*;

@Getter
@Setter
public class Relatorios {

    private int idRelatorio;
    private double custos;
    private double comissao;
    private double valorVenda;
    private boolean parceria;
    private boolean status;
    private Imoveis imovel;
    private Corretor corretor;
 
    private Comprador comprador;
    
    private LocalDate dataFinal;
    private int telefonemas;
    private int propostas;
    private int visitas;

    ArrayList<Relatorios> listaRelatorios;

    public Relatorios() {
      
        this.imovel = new Imoveis();
        this.comprador = new Comprador();
        this.corretor = new Corretor();
    }

}
