<?php

/**
 * All drops
 * @return string
 */
function drops_all() {
  $module_location = drupal_get_path("module", "rest_drops");
  drupal_add_js("$module_location/assets/js/drop_update.js");
  drupal_add_css("$module_location/assets/css/drop_update.css");

  $all_drops = get_all_drops();

  return theme("drops_page_all_template", array(
    'all_drops' => $all_drops
  ));
}

/**
 * Views a single drop
 * @param string $id The id of the drop
 */
function drops_single_drop($id) {
  $drop = get_single_drop($id);

  return theme("drops_page_single_template", array(
    'drop' => $drop
  ));
}

/**
 * Creating a new drop
 * @return string
 */
function drops_create() {
  if (isset($_POST['drop-name'])) {
    $drop_name = $_POST['drop-name'];
  }

  if (empty($drop_name)) {
    return theme("drops_page_create_template");
  }
  else {
    create_drop_helper($drop_name);
    return theme("drops_page_create_template");
  }
}

/**
 * Deletes a drop
 * @param string $drop_id The id of the drop
 */
function drops_delete($drop_id) {
  $response = restclient_delete("drops/$drop_id");
  if ($response->code == 200) {
    drupal_set_message(t("Successfully deleted $drop_id"));
    return l(t('Back to all drops'), 'admin/drops', array('attributes' => array('class' => array('form-submit'))));
  }
}

/**
 * Updates a drop
 * @param string $id The id of the drop
 */
function drop_update() {
  $drop_id = $_POST['dropId'];
  $drop_name = $_POST['dropValue'];
  $response = restclient_put("drops/$drop_id", array(
    'data' => array(
      'name' => $drop_name
    )
  ));
  if ($response->code == 200) {
    drupal_set_message(t("Drop with ID $drop_id was successfully updated to $drop_name."));
  }
}
