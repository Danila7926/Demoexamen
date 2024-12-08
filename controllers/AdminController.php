<?php

namespace app\controllers;
use yii\filters\AccessControl;
use Yii;
use yii\web\Controller;
use yii\web\Response;
use yii\filters\VerbFilter;
use app\models\LoginForm;
use app\models\ContactForm;

use app\models\Request;
use yii\data\ActiveDataProvider;
use app\models\Status;
use yii\web\NotFoundHttpException;


class AdminController extends \yii\web\Controller
{
    public function actionIndex()
    {
        $dataProvider = new ActiveDataProvider([
            'query' => Request::find(),
            
            'pagination' => [
                'pageSize' => 5
            ],
            'sort' => [
                'defaultOrder' => [
                    'id' => SORT_DESC,
                ]
            ],
            
        ]);

        return $this->render('index', [
            'dataProvider' => $dataProvider,
        ]);
    }


    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::class,
                'only' => ['*'],
                'rules' => [
                    [
                        'actions' => ['index','ok','bad'],
                        'allow' => true,
                        'roles' => ['@'],
                        'matchCallback'=>function($rul, $action){
                            return \Yii::$app->user->identity->validateAdmin();
                        }
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::class,
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }
    public function actionOk($id){
    $customers = Request::find()
    ->where(['id' => $id])
    ->one();
    if ($customers -> status->code == 'new'){
        $customers-> status_id= Status::findOne(['code' => 'ok'])->id;
        $customers->save();
    }
    return $this->redirect(['index']);
    }
    public function actionBad($id){
        $customers = Request::find()
        ->where(['id' => $id])
        ->one();
        if ($customers -> status->code == 'new'){
            $customers-> status_id= Status::findOne(['code' => 'delete'])->id;
            $customers->save();
        }
        return $this->redirect(['index']);
        }
    
}
