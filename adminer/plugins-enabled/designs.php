<?php

require_once 'plugins/designs.php';

$designs = [];

foreach (glob("designs/*", GLOB_ONLYDIR) as $filename) {
    $designs["$filename/adminer.css"] = basename($filename);
}

return new AdminerDesigns($designs);
