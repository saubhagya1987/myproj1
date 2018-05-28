package in.fiinfra.util;

import javax.annotation.PostConstruct;

import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.HttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.client.RestTemplate;

public class RestClient {

    private final RestTemplate template;
    private final RestClientProperties clientProperties;
    private final HttpClient httpClient;

    @Autowired
    public RestClient() {
        this.template = new RestTemplate();
        this.clientProperties = new RestClientProperties();
        this.httpClient = HttpClientBuilder.create().build();
;
    }

    @PostConstruct
    public void init() {
        setCredentials(clientProperties.getUsername(), clientProperties.getPassword());
    }

    /**
     * Gets rest template.
     */
    public RestTemplate getRestTemplate() {
        return template;
    }

    /**
     * Creates URL based on the URI passed in.
     */
    public String createUrl(String uri) {
        StringBuilder sb = new StringBuilder();

        sb.append(clientProperties.getUrl());
        sb.append(clientProperties.getApiPath());
        sb.append(uri);

        System.out.println("URL is '{}'." + sb.toString());

        return sb.toString();
    }

    /**
     * Set default credentials on HTTP client.
     */
    public void setCredentials(String userName, String password) {
        UsernamePasswordCredentials creds =
                new UsernamePasswordCredentials(clientProperties.getUsername(), clientProperties.getPassword());
        AuthScope authScope = new AuthScope(AuthScope.ANY_HOST, AuthScope.ANY_PORT, AuthScope.ANY_REALM);

        //httpClient. setCredentials(authScope, creds);
    }

}
