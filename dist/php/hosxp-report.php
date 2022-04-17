<?php
include_once("condb.php");
$requestData = $_REQUEST;

$sql = "  SELECT @a:=@a+1 AS rows, CURTIME(),`ovst`.`vsttime` ,TIMEDIFF(CURTIME(), `ovst`.`vsttime`) AS `TIMEDIFF`, TIME_FORMAT( TIMEDIFF(CURTIME(), `ovst`.`vsttime`) , '%H : %i') as TIMEDIFF1,
	`ovst`.`oqueue`,
	`er_regist`.`er_emergency_level_id`,
	`er_emergency_level`.`er_emergency_level_name`,
	`ovst`.`vn`,
	`ovst`.`hn`,
	CONCAT( `patient`.`pname`, `patient`.`fname`,' ', `patient`.`lname` ) AS `ptname`,
	`er_dch_type`.`NAME`,
	`ovst`.`vstdate`,(`ovst`.`vsttime` ) AS `time_as_visit`,
	`ovst`.`main_dep`,
	`er_regist`.`observe`,
	`ovst`.`cur_dep`, 
	`kskdepartment`.`department`,
	`ovst`.`vsttime`,
	`ovst`.`cur_dep`,
	`kskdepartment`.`department` 
FROM `er_regist` 
	LEFT OUTER JOIN er_emergency_level ON `er_emergency_level`.`er_emergency_level_id` = `er_regist`.`er_emergency_level_id`
	LEFT OUTER JOIN `ovst` ON `ovst`.`vn` = `er_regist`.`vn`
	LEFT OUTER JOIN `patient` ON `patient`.`hn` = `ovst`.`hn`
	LEFT OUTER JOIN `kskdepartment` ON `ovst`.`cur_dep` = `kskdepartment`.`depcode`
	LEFT OUTER JOIN `service_time` ON `service_time`.`vn` = `er_regist`.`vn`
	LEFT OUTER JOIN `er_dch_type` ON `er_dch_type`.`er_dch_type` = `er_regist`.`er_dch_type` 
WHERE
	ovst.vstdate =(CURDATE())
	AND `ovst`.`an` IS NULL 
	AND `ovst`.`cur_dep` IN ('015') 
GROUP BY
	`er_regist`.`vn`
ORDER BY
	`er_regist`.`er_emergency_level_id` ASC,
	`ovst`.`oqueue` ";

$query = mysqli_query($mysqli, $sql);
$totalData = mysqli_num_rows($query);
$totalFiltered = $totalData;

$searchKeyWord = htmlspecialchars($requestData['search']['value']);
if (!empty($searchKeyWord)) {
    $sql .= " WHERE oqueue LIKE '" . $searchKeyWord . "%' ";
    $sql .= " OR er_emergency_level_id LIKE '" . $searchKeyWord . "%' ";
    $sql .= " OR ptname LIKE '" . $searchKeyWord . "%' ";
    $query = mysqli_query($conn, $sql);
    $totalFiltered = mysqli_num_rows($query);
}

$data = array();
while ($row = mysqli_fetch_array($query)) {  // preparing an array
    $num++;
    $nestedData = array();
    $nestedData[] = $num;
    $nestedData[] = $row["oqueue"];
    $nestedData[] = $row["ptname"];
    $nestedData[] = $row["TIMEDIFF1"];
    $nestedData[] = $row["er_emergency_level_name"];
    $nestedData[] = $row["er_emergency_level_id"];

    $data[] = $nestedData;
 
}


function json_encode_utf8($array)
{
    return preg_replace("/\\\\u([a-f0-9]{4})/e", "iconv('UCS-4LE','UTF-8',pack('V', hexdec('U$1')))", json_encode($array));
}

$json_data = array(
    "draw"            => intval($requestData['draw']),
    "recordsTotal"    => intval($totalData),
    "recordsFiltered" => intval($totalFiltered),
    "data"            => $data
);

echo json_encode_utf8($json_data);
