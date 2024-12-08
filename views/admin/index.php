<?php

use app\models\Request;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;
use yii\widgets\LinkPager;

/** @var yii\web\View $this */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = 'Заявки';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="request-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Создать заявку', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

<?php foreach ($dataProvider -> models as $model) {
    if ($model -> status->code == 'new'){
        $col = 'text-white bg-warning';
    }
    if ($model -> status->code == 'ok'){
        $col = 'text-white bg-success';
    }
    if ($model -> status->code  == 'delete'){
        $col = 'text-white bg-danger';
    }
    ?>
    <div class="card <?php echo $col ?> mb-3">
        <div class="card-header"><?php echo $model-> auto_number?></div>
        <div class="card-body">
            <h5 class="card-title"><?php echo $model-> status-> name  ?></h5>
            <h4 class="card-title"><?php echo $model-> user->first_name; echo $model-> user->last_name; echo $model-> user->middle_name;   ?></h4>
            <p class="card-text"><?php echo $model-> text  ?></p>
            <p class="card-text"><?php echo $model-> user->phone;  ?></p>
            <p class="card-text"><?php echo $model-> created_at ?></p>
            <?php if ($model -> status->code == 'new'){
            echo Html::a('Подтверждено', ['admin/ok', 'id' => $model ->id], ['class' => 'card-link']); 
              echo Html::a('Отклонено', ['admin/bad', 'id' => $model ->id], ['class' => 'card-link']);} ?>
        </div>
    </div>
    <?php
}
echo LinkPager::widget(['pagination'=> $dataProvider-> pagination,])
?>



</div>