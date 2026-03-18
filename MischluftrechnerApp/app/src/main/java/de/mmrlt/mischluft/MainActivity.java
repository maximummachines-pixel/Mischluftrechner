package de.mmrlt.mischluft;

import android.annotation.SuppressLint;
import androidx.appcompat.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;

public class MainActivity extends AppCompatActivity {

    private WebView webView;

    @SuppressLint("SetJavaScriptEnabled")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        // Statusleiste ausblenden
        getWindow().setFlags(
            WindowManager.LayoutParams.FLAG_FULLSCREEN,
            WindowManager.LayoutParams.FLAG_FULLSCREEN
        );

        setContentView(R.layout.activity_main);
        if(getSupportActionBar() != null) getSupportActionBar().hide();

        webView = findViewById(R.id.webview);

        // WebView Einstellungen
        WebSettings settings = webView.getSettings();
        settings.setJavaScriptEnabled(true);
        settings.setDomStorageEnabled(true);
        settings.setAllowFileAccess(true);
        settings.setAllowContentAccess(true);
        settings.setCacheMode(WebSettings.LOAD_DEFAULT);
        settings.setLoadWithOverviewMode(true);
        settings.setUseWideViewPort(true);
        settings.setBuiltInZoomControls(false);
        settings.setDisplayZoomControls(false);
        settings.setSupportZoom(true);
        settings.setTextZoom(100);

        // Pinch-Zoom auf dem Canvas funktioniert über Touch-Events in JS

        // WebViewClient: alle Links intern öffnen
        webView.setWebViewClient(new WebViewClient() {
            @Override
            public boolean shouldOverrideUrlLoading(WebView view, String url) {
                // Nur lokale Assets laden
                if (url.startsWith("file://")) {
                    view.loadUrl(url);
                    return true;
                }
                return false;
            }
        });

        // WebChromeClient für JS-Dialoge
        webView.setWebChromeClient(new WebChromeClient());

        // Hintergrundfarbe passend zur App
        webView.setBackgroundColor(0xFF1A1AFF);

        // Lade die lokale HTML-Datei aus assets
        webView.loadUrl("file:///android_asset/index.html");
    }

    // Zurück-Taste: WebView-History nutzen
    @Override
    public void onBackPressed() {
        if (webView.canGoBack()) {
            webView.goBack();
        } else {
            super.onBackPressed();
        }
    }

    @Override
    protected void onResume() {
        super.onResume();
        webView.onResume();
    }

    @Override
    protected void onPause() {
        super.onPause();
        webView.onPause();
    }

    @Override
    protected void onDestroy() {
        if (webView != null) {
            webView.destroy();
        }
        super.onDestroy();
    }
}
