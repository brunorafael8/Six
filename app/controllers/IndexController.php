<?php 

class IndexController extends \HXPHP\System\Controller
{
    public function indexAction()
        {

}
 public function cadastrarAction(){
        $this->view->setfile('index');

        var_dump($this->request->setCustonFilters(array(

            'email' => FILTER_VALIDETE_EMAIL , 
            )));
        $cadastrarUsuario = User:: cadastrar($this->request->post());

    }
}
