<?php

/**
 * Gets the access_token from this authorization and stores it in a table
 * that relates users to tokens.
 *
 * This is executed just after the user has granted authorization at FB and
 * is redirected back to the website.
 *
 */
function fboauth_tokens_action_authorize($app_id, $access_token) {
  global $user;

  if (!empty($access_token)) {
    $existing_token = fboauth_tokens_get_user_access_token();

    $record = array(
      'uid' => $user->uid,
      'access_token' => $access_token,
    );

    if ($existing_token) {
      $result = drupal_write_record('fboauth_tokens', $record, 'uid');
    }
    else {
      $result = drupal_write_record('fboauth_tokens', $record);
    }

    if ($result == SAVED_NEW || $result == SAVED_UPDATED) {
      drupal_set_message(t('Thank you, your comments can now be shared on your profile wall..'));
    }
    else {
      drupal_set_message(t('There was a problem trying to save your access token.'), 'error');
    }
  }
  else {
    drupal_set_message(t('No access token received from Facebook.'), 'error');
  }

  return 'user/' . $user->uid . '/fboauth';
}

/**
 * Prints a button to call the authorization action.
 */
function fboauth_tokens_auth_page() {
  $output = '';

  $output .= '<p>' . t('Clicking on the button below will redirect you to Facebook so you can grant this site application the required permissions. If you have already do so recently you will be redirected to this page immediatly, otherwise a page in Facebook will ask you for confirmation and you will be redirected here after that.') . '</p>';
  $output .= '<p>' . t('The authorization will be stored in this website as long as possible, but if at some point the application functionality stops working you should go back to this page and get a new authorization.') . '</p>';

  $output .= fboauth_action_display('fboauth_tokens_authorize_all');

  return $output;
}

function post_drupal_comment_facebook_callback($app_id, $access_token) {
  // Build the data array that we'd like to post to facebook.
  // See https://developers.facebook.com/docs/reference/api/user/#posts for valid array keys.
  $query = array(
    'link' => "http://example.com",
//    'picture' => url(drupal_get_path('theme', 'my_theme') . '/images/logo.png', array('absolute' => TRUE)),
//    'name' => t('@name loves Drupal', array('@name' => $user->name)),
    'name' => "The name",
    'caption' => "Caption part",
    'description' => "Example message/description",
    'app_id' => variable_get('fboauth_id', ''),
  );

  $response = fboauth_graph_query('me/feed', $access_token, $query, 'POST');
  if (isset($response->id)) {
    drupal_set_message(t("You have posted to your facebook wall. That must have been hard. Take a break. Have drink. You're done."));
  }
  else {
    watchdog('mymodule', 'Error executing fboauth action: @error', array('@error' => (isset($reponse->error) ? $response->error : t('Something went horribly wrong'))));
    drupal_set_message(t("Oops! We couldn't post to your facebook wall. Try clicking harder."));
  }

// Optionally redirect user.
  return '<front>';
}
