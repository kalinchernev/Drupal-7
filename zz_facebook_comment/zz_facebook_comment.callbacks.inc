<?php

/**
 * Connects the user to facebook as fboauth module does normally.
 * In addition, it saves the user token in the database.
 * This token is later used to post comments on facebook on behalf of the user.
 * @param $app_id Avaialable thanks to the fboauth module callback system
 * @param $access_token Avaialable thanks to the fboauth module callback system
 * @return void The path where the user is redirected when connected
 */
function connect_token_save($app_id, $access_token) {
    /* We run the connect method normally after saving the token */
    fboauth_action_connect($app_id, $access_token);

    global $user;
    dpm($user);

    if (!empty($access_token)) {
        $existing_token = fboauth_tokens_get_user_access_token();

        $record = array(
            'uid' => $user->uid,
            'access_token' => $access_token,
        );

        if ($existing_token) {
            drupal_write_record('fboauth_tokens', $record, 'uid');
        }
        else {
            drupal_write_record('fboauth_tokens', $record);
        }
    }
    else {
        drupal_set_message(t('No access token received from Facebook.'), 'error');
    }

    return 'user/' . $user->uid;

}

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
