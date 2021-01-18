public class EBUtilities {
  public static String formatBody(String bodyRaw) {
    String indexStart = '<pre><code class="language-json">';
    String indexEnd = '</code></pre>';
    String responseEscaped = bodyRaw.substring(
      bodyRaw.indexOf(indexStart) + indexStart.length(),
      bodyRaw.indexOf(indexEnd)
    );
    // iterate through all line and remove line when match with "resource_uri"
    // required because invalid JSON
    List<String> responseJSONAllLines = responseEscaped.unescapeHtml4()
      .split('\n');
    String responseJSON = '';
    String match = '"resource_uri"';
    for (String line : responseJSONAllLines) {
      if (!line.contains(match)) {
        responseJSON += line;
      }
    }
    // replace reserved words
    responseJSON = responseJSON.replace('"name"', '"eventname"');
    responseJSON = responseJSON.replace('"start"', '"eventstart"');
    responseJSON = responseJSON.replace('"end"', '"eventend"');
    return responseJSON;
  }
}
