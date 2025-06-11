package util;


import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.*;

public class XMLLangLoader {

    private Map<String, Map<String, String>> messages = new HashMap<>();

    public XMLLangLoader(InputStream xmlStream) {
        try {
            Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(xmlStream);
            NodeList msgNodes = doc.getElementsByTagName("message");

            for (int i = 0; i < msgNodes.getLength(); i++) {
                Element msgElement = (Element) msgNodes.item(i);
                String key = msgElement.getAttribute("key");

                Map<String, String> translations = new HashMap<>();
                translations.put("fr", msgElement.getElementsByTagName("fr").item(0).getTextContent());
                translations.put("en", msgElement.getElementsByTagName("en").item(0).getTextContent());
                translations.put("ar", msgElement.getElementsByTagName("ar").item(0).getTextContent());

                messages.put(key, translations);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String getText(String key, String lang) {
        Map<String, String> trans = messages.get(key);
        if (trans != null) {
            return trans.getOrDefault(lang, trans.get("en"));
        }
        return key; 
    }
}