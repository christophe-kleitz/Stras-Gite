<?php

namespace App\Service;

use DateTime;

class TimeSetter
{

    public static function setDate(string $modifier)
    {
        $date = new DateTime();
        $date = $date->modify($modifier)->format('Y-m-d');
        return $date;
    }
}
