@isTest
global class Test_EBAttendeesCalloutMockWithData implements HttpCalloutMock {
  global HttpResponse respond(HttpRequest req) {
    // Create a fake response
    HttpResponse res = new HttpResponse();
    res.setHeader('Content-Type', 'application/json');
    res.setStatusCode(200);
    String body = '';
    body += '<pre><code class="language-json">{' + '\n';
    body += '    &quot;pagination&quot;: {' + '\n';
    body += '        &quot;object_count&quot;: 1, ' + '\n';
    body += '        &quot;page_number&quot;: 1, ' + '\n';
    body += '        &quot;page_size&quot;: 50, ' + '\n';
    body += '        &quot;page_count&quot;: 1, ' + '\n';
    body += '        &quot;has_more_items&quot;: false' + '\n';
    body += '    }, ' + '\n';
    body += '    &quot;attendees&quot;: [' + '\n';
    body += '        {' + '\n';
    body += '            &quot;team&quot;: null, ' + '\n';
    body += '            &quot;costs&quot;: {' + '\n';
    body += '                &quot;base_price&quot;: {' + '\n';
    body +=
      '                    &quot;display&quot;: &quot;\u20ac0.00&quot;, ' +
      '\n';
    body +=
      '                    &quot;currency&quot;: &quot;EUR&quot;, ' + '\n';
    body += '                    &quot;value&quot;: 0, ' + '\n';
    body +=
      '                    &quot;major_value&quot;: &quot;0.00&quot;' + '\n';
    body += '                }, ' + '\n';
    body += '                &quot;eventbrite_fee&quot;: {' + '\n';
    body +=
      '                    &quot;display&quot;: &quot;\u20ac0.00&quot;, ' +
      '\n';
    body +=
      '                    &quot;currency&quot;: &quot;EUR&quot;, ' + '\n';
    body += '                    &quot;value&quot;: 0, ' + '\n';
    body +=
      '                    &quot;major_value&quot;: &quot;0.00&quot;' + '\n';
    body += '                }, ' + '\n';
    body += '                &quot;gross&quot;: {' + '\n';
    body +=
      '                    &quot;display&quot;: &quot;\u20ac0.00&quot;, ' +
      '\n';
    body +=
      '                    &quot;currency&quot;: &quot;EUR&quot;, ' + '\n';
    body += '                    &quot;value&quot;: 0, ' + '\n';
    body +=
      '                    &quot;major_value&quot;: &quot;0.00&quot;' + '\n';
    body += '                }, ' + '\n';
    body += '                &quot;payment_fee&quot;: {' + '\n';
    body +=
      '                    &quot;display&quot;: &quot;\u20ac0.00&quot;, ' +
      '\n';
    body +=
      '                    &quot;currency&quot;: &quot;EUR&quot;, ' + '\n';
    body += '                    &quot;value&quot;: 0, ' + '\n';
    body +=
      '                    &quot;major_value&quot;: &quot;0.00&quot;' + '\n';
    body += '                }, ' + '\n';
    body += '                &quot;tax&quot;: {' + '\n';
    body +=
      '                    &quot;display&quot;: &quot;\u20ac0.00&quot;, ' +
      '\n';
    body +=
      '                    &quot;currency&quot;: &quot;EUR&quot;, ' + '\n';
    body += '                    &quot;value&quot;: 0, ' + '\n';
    body +=
      '                    &quot;major_value&quot;: &quot;0.00&quot;' + '\n';
    body += '                }, ' + '\n';
    body += '                &quot;creator_credits_used&quot;: null' + '\n';
    body += '            }, ' + '\n';
    body +=
      '            &quot;resource_uri&quot;: &quot;<a href="https://www.eventbriteapi.com/v3/events/event_id/attendees/attendee_id/?token=my_token">https://www.eventbriteapi.com/v3/events/event_id/attendees/attendee_id/</a>&quot;, ' +
      '\n';
    body += '            &quot;id&quot;: &quot;attendee_id&quot;, ' + '\n';
    body +=
      '            &quot;changed&quot;: &quot;2021-01-16T10:37:30Z&quot;, ' +
      '\n';
    body +=
      '            &quot;created&quot;: &quot;2021-01-16T10:37:30Z&quot;, ' +
      '\n';
    body += '            &quot;quantity&quot;: 1, ' + '\n';
    body += '            &quot;variant_id&quot;: null, ' + '\n';
    body += '            &quot;profile&quot;: {' + '\n';
    body +=
      '                &quot;first_name&quot;: &quot;EBFirstname&quot;, ' +
      '\n';
    body +=
      '                &quot;last_name&quot;: &quot;EBLastname&quot;, ' + '\n';
    body +=
      '                &quot;email&quot;: &quot;ebfirstname.eblastname@mail.com&quot;, ' +
      '\n';
    body +=
      '                &quot;name&quot;: &quot;EBFirstname EBLastname&quot;, ' +
      '\n';
    body += '                &quot;addresses&quot;: {}' + '\n';
    body += '            }, ' + '\n';
    body += '            &quot;barcodes&quot;: [' + '\n';
    body += '                {' + '\n';
    body +=
      '                    &quot;status&quot;: &quot;unused&quot;, ' + '\n';
    body +=
      '                    &quot;barcode&quot;: &quot;15817516512209438401001&quot;, ' +
      '\n';
    body +=
      '                    &quot;created&quot;: &quot;2021-01-16T10:37:31Z&quot;, ' +
      '\n';
    body +=
      '                    &quot;changed&quot;: &quot;2021-01-16T10:37:31Z&quot;, ' +
      '\n';
    body += '                    &quot;checkin_type&quot;: 0, ' + '\n';
    body += '                    &quot;is_printed&quot;: false' + '\n';
    body += '                }' + '\n';
    body += '            ], ' + '\n';
    body += '            &quot;answers&quot;: [], ' + '\n';
    body += '            &quot;checked_in&quot;: false, ' + '\n';
    body += '            &quot;cancelled&quot;: false, ' + '\n';
    body += '            &quot;refunded&quot;: false, ' + '\n';
    body += '            &quot;affiliate&quot;: &quot;oddtdteb&quot;, ' + '\n';
    body += '            &quot;guestlist_id&quot;: null, ' + '\n';
    body += '            &quot;invited_by&quot;: null, ' + '\n';
    body += '            &quot;status&quot;: &quot;Attending&quot;, ' + '\n';
    body +=
      '            &quot;ticket_class_name&quot;: &quot;ticketclass&quot;, ' +
      '\n';
    body +=
      '            &quot;delivery_method&quot;: &quot;electronic&quot;, ' +
      '\n';
    body += '            &quot;event_id&quot;: &quot;event_id&quot;, ' + '\n';
    body += '            &quot;order_id&quot;: &quot;order_id&quot;, ' + '\n';
    body +=
      '            &quot;ticket_class_id&quot;: &quot;ticket_class_id&quot;' +
      '\n';
    body += '        }' + '\n';
    body += '    ]' + '\n';
    body += '}</code></pre>' + '\n';
    res.setBody(body);
    return res;
  }
}
