package com.xwj.util;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

/**
 * Created by stephan on 20.03.16.
 */
public class JwtUser implements UserDetails {

    /**
	 * 
	 */
	private static final long serialVersionUID = 6150764073865831068L;
	private final Integer id;
    private final String username;
    private final String password;
    private final String email;

    public JwtUser(
          Integer id,
          String username,
          String email,
          String password
    ) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.password = password;
    }


    public Integer getId() {
		return id;
	}


	@Override
    public String getUsername() {
        return username;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    public String getEmail() {
        return email;
    }

    @Override
    public String getPassword() {
        return password;
    }


	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return false;
	}

}
