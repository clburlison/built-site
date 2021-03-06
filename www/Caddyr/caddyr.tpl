<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>MicroMDM Builds</title>
    <link rel="stylesheet" href="/Caddyr/style.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="/Caddyr/app.js" type="text/javascript" charset="utf-8"></script>
    <link rel="shortcut icon" type="image/x-icon" href="/Caddyr/favicon.ico">
    <link rel="icon" type="image/x-icon" href="/Caddyr/favicon.ico">
    <link rel="import" href="info.html">
  </head>
  <body>
    <h1><a href="https://builds.clburlison.net/">MicroMDM Builds</a></h1>
    <center>
      These are automated development builds from the master Git branch for testing purposes.<br>
      Visit the Github project <u><a href="https://github.com/micromdm/micromdm">micromdm</a></u>.
    </center>
    <div class="wrapper" id="main_listing">
      <form>
        <input id="searchTerm" name="filter" type="search" autocapitalize="none" onkeyup="doSearch()">
      </form>
      <table>
        <thead>
          <tr>
            <th>
              <img src="/Caddyr/icons/default.png" alt="[ICO]">
            </th>
            <th><a id="link-name" >Name</a></th>
            <th><a id="link-time" >Modified </a></th>
            <th><a id="link-size" >Size</a></th>
          </tr>
        </thead>
        <tbody id="dataTable">
          {{if .CanGoUp}}
          <tr>
            <td valign="top">
              <a href="..">
                <img src="/Caddyr/icons/up.png" alt="[ICO]">
              </a>
            </td>
            <td>
              <a href="..">Go up a dir</a>
            </td>
            <td></td>
            <td align="right">&mdash;</td>
          </tr>
          {{end}}

          {{range .Items}}
          {{if ne .Name "Caddyr"}}
          {{if ne .Name ".gitignore"}}
          {{if ne .Name ".DS_Store"}}
          {{if ne .Name "404.html"}}
          {{if ne .Name "info.html"}}
          {{if not .IsDir}}
          <a class="play" href="intent:{{html .URL}}#Intent;scheme=file;action=android.intent.action.VIEW;end;"target="_blank">
            {{end}}
            <tr>
              <td valign="top">
                <a href="{{html .URL}}">
                  {{if .IsDir}}
                  <img src="/Caddyr/icons/dir.png" alt="[IMG]"></a>
                {{else}}
                <script>
                  document.write('<img src="/Caddyr/icons/'+extension("{{html .Name}}")+'.png" alt="[IMG]" onerror="this.src=\'/Caddyr/icons/default.png\'"/>');
                </script>
                {{end}}
              </td>
              <td>
                <a href="{{html .URL}}">{{html .Name}}</a>
              </td>
              <td>
                <script>
                  var UtcDate = moment.utc("{{.ModTime}}", "YYYY-MM-DD HH:mm:ss.SSS Z").toDate();
                  var localDate = moment(UtcDate).local().format('YYYY-MM-DD HH:mm:ss');
                  document.write(localDate);
                </script>
              </td>
              <td align="right">
                {{if not .IsDir}}
                <script>
                  document.write(humanFileSize({{.Size}}));
                </script>
                {{else}}
                Directory
                {{end}}
              </td>
              {{if not .IsDir}}
            </a>
            {{end}}
          </tr>
        {{end}}
        {{end}}
        {{end}}
        {{end}}
        {{end}}
        {{end}}
      </tbody>
    </table>

    <!-- Idea from http://www.onextrapixel.com/html5-imports-embedding-an-html-file-inside-another-html-file/ -->
    <script>
      var doc = document.querySelector('link[rel="import"]').import;
      var text = doc.querySelector('.info');
      var node = document.getElementById('main_listing');
      node.appendChild(text.cloneNode(true));
    </script>

  </div>
</body>
<footer>
  <b>Caddyr</b> by <a href="https://github.com/Drakirus/Caddyr">@drakirus</a> |
  <a href="https://icons8.com">Icon pack by Icons8</a> |
  Powered by <a href="https://caddyserver.com/">Caddy</a>
</footer>
</html>
<!-- vim:set ft=html: -->
