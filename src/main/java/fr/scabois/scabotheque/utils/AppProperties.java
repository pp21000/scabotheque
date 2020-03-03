package fr.scabois.scabotheque.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class AppProperties {

    public static String getPropertie(String key) {
	Properties prop = new Properties();

	InputStream inProp = AppProperties.class.getResourceAsStream("/application.properties");

	String ret = "";
	try {
	    prop.load(inProp);
	    inProp.close();
	    ret = prop.get(key).toString();
	    System.out.println(ret);
	} catch (NullPointerException npe) {
	    System.err.println("Erreur lors du chargement du fichier properties : le fichier n'a pas été trouvé.");
	} catch (IOException e) {
	    System.err.println("Erreur lors du chargement du fichier properties : " + e.getMessage());
	}
	return ret;
    }

}
