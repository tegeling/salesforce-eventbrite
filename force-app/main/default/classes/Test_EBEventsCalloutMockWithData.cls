@isTest
global class Test_EBEventsCalloutMockWithData implements HttpCalloutMock {
  global HttpResponse respond(HttpRequest req) {
    // Create a fake response
    HttpResponse res = new HttpResponse();
    res.setHeader('Content-Type', 'application/json');
    res.setStatusCode(200);
    String body = '';
    body += '<pre><code class="language-json">{' + '\n';
    body += '&quot;pagination&quot;: {' + '\n';
    body += '    &quot;object_count&quot;: 1, ' + '\n';
    body += '    &quot;page_number&quot;: 1, ' + '\n';
    body += '    &quot;page_size&quot;: 50, ' + '\n';
    body += '    &quot;page_count&quot;: 1, ' + '\n';
    body += '    &quot;has_more_items&quot;: false' + '\n';
    body += '}, ' + '\n';
    body += '    &quot;events&quot;: [' + '\n';
    body += '        {' + '\n';
    body += '            &quot;name&quot;: {' + '\n';
    body +=
      '                &quot;text&quot;: &quot;SampleEvent&quot;, ' + '\n';
    body += '                &quot;html&quot;: &quot;SampleEvent&quot;' + '\n';
    body += '            }, ' + '\n';
    body += '            &quot;description&quot;: {' + '\n';
    body +=
      '                &quot;text&quot;: &quot;SampleDescription&quot;, ' +
      '\n';
    body +=
      '                &quot;html&quot;: &quot;SampleDescription&quot;' + '\n';
    body += '            }, ' + '\n';
    body +=
      '            &quot;url&quot;: &quot;https://www.eventbrite.de/e/sampleevent&quot;, ' +
      '\n';
    body += '            &quot;start&quot;: {' + '\n';
    body +=
      '                &quot;timezone&quot;: &quot;Europe/Berlin&quot;, ' +
      '\n';
    body +=
      '                &quot;local&quot;: &quot;2021-01-23T08:00:00&quot;, ' +
      '\n';
    body +=
      '                &quot;utc&quot;: &quot;2021-01-23T07:00:00Z&quot;' +
      '\n';
    body += '            }, ' + '\n';
    body += '            &quot;end&quot;: {' + '\n';
    body +=
      '                &quot;timezone&quot;: &quot;Europe/Berlin&quot;, ' +
      '\n';
    body +=
      '                &quot;local&quot;: &quot;2021-01-23T13:00:00&quot;, ' +
      '\n';
    body +=
      '                &quot;utc&quot;: &quot;2021-01-23T12:00:00Z&quot;' +
      '\n';
    body += '            }, ' + '\n';
    body +=
      '            &quot;organization_id&quot;: &quot;your_organization_id&quot;, ' +
      '\n';
    body +=
      '            &quot;created&quot;: &quot;2021-01-16T09:33:38Z&quot;, ' +
      '\n';
    body +=
      '            &quot;changed&quot;: &quot;2021-01-16T10:34:58Z&quot;, ' +
      '\n';
    body +=
      '            &quot;published&quot;: &quot;2021-01-16T10:34:58Z&quot;, ' +
      '\n';
    body += '            &quot;capacity&quot;: 30, ' + '\n';
    body += '            &quot;capacity_is_custom&quot;: false, ' + '\n';
    body += '            &quot;status&quot;: &quot;live&quot;, ' + '\n';
    body += '            &quot;currency&quot;: &quot;EUR&quot;, ' + '\n';
    body += '            &quot;listed&quot;: false, ' + '\n';
    body += '            &quot;shareable&quot;: false, ' + '\n';
    body += '            &quot;invite_only&quot;: false, ' + '\n';
    body += '            &quot;online_event&quot;: false, ' + '\n';
    body += '            &quot;show_remaining&quot;: false, ' + '\n';
    body += '            &quot;tx_time_limit&quot;: 480, ' + '\n';
    body += '            &quot;hide_start_date&quot;: false, ' + '\n';
    body += '            &quot;hide_end_date&quot;: false, ' + '\n';
    body += '            &quot;locale&quot;: &quot;de_DE&quot;, ' + '\n';
    body += '            &quot;is_locked&quot;: false, ' + '\n';
    body +=
      '            &quot;privacy_setting&quot;: &quot;unlocked&quot;, ' + '\n';
    body += '            &quot;is_series&quot;: false, ' + '\n';
    body += '            &quot;is_series_parent&quot;: false, ' + '\n';
    body +=
      '            &quot;inventory_type&quot;: &quot;limited&quot;, ' + '\n';
    body += '            &quot;is_reserved_seating&quot;: false, ' + '\n';
    body += '            &quot;show_pick_a_seat&quot;: false, ' + '\n';
    body += '            &quot;show_seatmap_thumbnail&quot;: false, ' + '\n';
    body +=
      '            &quot;show_colors_in_seatmap_thumbnail&quot;: false, ' +
      '\n';
    body += '            &quot;source&quot;: &quot;coyote&quot;, ' + '\n';
    body += '            &quot;is_free&quot;: true, ' + '\n';
    body += '            &quot;version&quot;: null, ' + '\n';
    body += '            &quot;summary&quot;: &quot;SampleEvent&quot;, ' + '\n';
    body += '            &quot;logo_id&quot;: null, ' + '\n';
    body +=
      '            &quot;organizer_id&quot;: &quot;your_organization_id&quot;, ' +
      '\n';
    body += '            &quot;venue_id&quot;: null, ' + '\n';
    body += '            &quot;category_id&quot;: &quot;108&quot;, ' + '\n';
    body += '            &quot;subcategory_id&quot;: null, ' + '\n';
    body += '            &quot;format_id&quot;: &quot;14&quot;, ' + '\n';
    body += '            &quot;id&quot;: &quot;event_id&quot;, ' + '\n';
    body +=
      '            &quot;resource_uri&quot;: &quot;<a href="https://www.eventbriteapi.com/v3/events/sampleevent">https://www.eventbriteapi.com/v3/events/sampleevent/</a>&quot;, ' +
      '\n';
    body += '            &quot;is_externally_ticketed&quot;: false, ' + '\n';
    body += '            &quot;logo&quot;: null' + '\n';
    body += '        }' + '\n';
    body += '    ]' + '\n';
    body += '}</code></pre>' + '\n';
    res.setBody(body);
    return res;
  }
}
