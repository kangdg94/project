package util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class gmail extends Authenticator {
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("kdk7854", "aa950205");
		
	}

}
