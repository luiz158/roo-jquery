// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package br.com.yaw.web;

import br.com.yaw.model.Cliente;
import br.com.yaw.web.ApplicationConversionServiceFactoryBean;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    declare @type: ApplicationConversionServiceFactoryBean: @Configurable;
    
    public Converter<Cliente, String> ApplicationConversionServiceFactoryBean.getClienteToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<br.com.yaw.model.Cliente, java.lang.String>() {
            public String convert(Cliente cliente) {
                return new StringBuilder().append(cliente.getNome()).append(" ").append(cliente.getCpf()).toString();
            }
        };
    }
    
    public Converter<Long, Cliente> ApplicationConversionServiceFactoryBean.getIdToClienteConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, br.com.yaw.model.Cliente>() {
            public br.com.yaw.model.Cliente convert(java.lang.Long id) {
                return Cliente.findCliente(id);
            }
        };
    }
    
    public Converter<String, Cliente> ApplicationConversionServiceFactoryBean.getStringToClienteConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, br.com.yaw.model.Cliente>() {
            public br.com.yaw.model.Cliente convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Cliente.class);
            }
        };
    }
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(getClienteToStringConverter());
        registry.addConverter(getIdToClienteConverter());
        registry.addConverter(getStringToClienteConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
}
