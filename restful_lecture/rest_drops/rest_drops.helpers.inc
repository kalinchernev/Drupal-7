<?php

/**
 * Getting all drops
 * @return array
 */
function get_all_drops() {
  $response_json = restclient_get("drops");
  $response = json_decode($response_json->data);

  return $response;
}

/**
 * Getting all drops
 * @return array
 */
function get_single_drop($id) {
  $response_json = restclient_get("drops/$id");
  $response = json_decode($response_json->data);

  return $response;
}

function create_drop_helper($name) {
  if (!empty($name)) {

    $response = restclient_post('drops', array(
      'data' => array(
        'name' => $name
      )
    ));
    if ($response->code == 200) {
      drupal_set_message(t("$name created"));
    }
    else {
      drupal_set_message(t("$name failed to be created", "error"));
    }
  }
}
