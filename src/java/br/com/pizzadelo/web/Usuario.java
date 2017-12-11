package br.com.pizzadelo.web;

public class Usuario {
    private String nm_usuario;
    private String nm_email_usuario;
    private String cd_password_usuario;
    private char nm_tipo_usuario;
    private double cd_cpf_usuario;

    public Usuario(String nm_usuario, String nm_email_usuario, String cd_password_usuario, char nm_tipo_usuario, double cd_cpf_usuario) {
        this.nm_usuario = nm_usuario;
        this.nm_email_usuario = nm_email_usuario;
        this.cd_password_usuario = cd_password_usuario;
        this.nm_tipo_usuario = nm_tipo_usuario;
        this.cd_cpf_usuario = cd_cpf_usuario;
    }

    
    public String getNm_usuario() {
        return nm_usuario;
    }

    public void setNm_usuario(String nm_usuario) {
        this.nm_usuario = nm_usuario;
    }

    public String getNm_email_usuario() {
        return nm_email_usuario;
    }

    public void setNm_email_usuario(String nm_email_usuario) {
        this.nm_email_usuario = nm_email_usuario;
    }

    public String getCd_password_usuario() {
        return cd_password_usuario;
    }

    public void setCd_password_usuario(String cd_password_usuario) {
        this.cd_password_usuario = cd_password_usuario;
    }

    public char getNm_tipo_usuario() {
        return nm_tipo_usuario;
    }

    public void setNm_tipo_usuario(char nm_tipo_usuario) {
        this.nm_tipo_usuario = nm_tipo_usuario;
    }

    public double getCd_cpf_usuario() {
        return cd_cpf_usuario;
    }

    public void setCd_cpf_usuario(int cd_cpf_usuario) {
        this.cd_cpf_usuario = cd_cpf_usuario;
    }
    
    
    
}
