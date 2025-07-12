camera = camera_create();

global_res_x=global.res_x;
global_res_y=global.res_y;

var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
var pm = matrix_build_projection_ortho(global_res_x,global_res_y,-100000,10000);

camera_set_view_mat(camera,vm);
camera_set_proj_mat(camera,pm);

view_camera[0]=camera;

follow=self;
nearcam=false;

xto=x;
yto=y;

cam_smooth=10;

instance_create(obj_fx_vignette);

alarm[0]=10;