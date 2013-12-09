// This function calculates edd = Mhat^(-1)*v for a "noodle"
// made up of 3 ANCF identical beam elements.
//
// As such, the input vector 'v' and the output vector 'edd'
// are assumed to be of length (3+1)*6 = 24
//
// Note that the matrix Mhat used for this calculation is just
//    Mhat = \int_0^1 { S^T(\xi) S(\xi) d \xi } 
// As such, the result must be muliplied by 1/(rho * A * le)
// where le is element length: le = l / numElements

#include <stdio.h>
#include "SPHCudaUtils.h"
#include "minv_vec.cuh"

void minv_vec_3(real_* edd, real_* v, real_ le);
void minv_vec_4(real_* edd, real_* v, real_ le);

void min_vec(real_* edd, real_* v, real_ le, int nE) {
	if (nE == 3) {
		minv_vec_3(edd, v, le);
	}
	else if (nE == 4) {
		minv_vec_4(edd, v, le);
	} else {
		printf("Error!!: Number of beam elements equal to %d is not supported. Code exits!\n;");
	}
}

void minv_vec_3(real_* edd, real_* v, real_ le)
{
	real_ v1  = v[0];
	real_ v2  = v[1];
	real_ v3  = v[2];
	real_ v4  = v[3];
	real_ v5  = v[4];
	real_ v6  = v[5];
	real_ v7  = v[6];
	real_ v8  = v[7];
	real_ v9  = v[8];
	real_ v10 = v[9];
	real_ v11 = v[10];
	real_ v12 = v[11];
	real_ v13 = v[12];
	real_ v14 = v[13];
	real_ v15 = v[14];
	real_ v16 = v[15];
	real_ v17 = v[16];
	real_ v18 = v[17];
	real_ v19 = v[18];
	real_ v20 = v[19];
	real_ v21 = v[20];
	real_ v22 = v[21];
	real_ v23 = v[22];
	real_ v24 = v[23];

	real_ t2 = 1.0/le;
	real_ t3 = 1.0/(le*le);

	edd[0]  = v1*1.386048285594416E1+v7*1.128494603150387+v13*2.367748579274572E-1-v19*2.796445325908692E-1-t2*(v4*8.962202982569892E1+v10*1.296235554368969E1+v16*3.980319615545978+v22*3.753766352645028);
	edd[1]  = v2*1.386048285594416E1+v8*1.128494603150387+v14*2.367748579274572E-1-v20*2.796445325908692E-1-t2*(v5*8.962202982569892E1+v11*1.296235554368969E1+v17*3.980319615545978+v23*3.753766352645028);
	edd[2]  = v3*1.386048285594416E1+v9*1.128494603150387+v15*2.367748579274572E-1-v21*2.796445325908692E-1-t2*(v6*8.962202982569892E1+v12*1.296235554368969E1+v18*3.980319615545978+v24*3.753766352645028);
	edd[3]  = -t2*(v1*8.962202982569892E1+v7*1.372973797627675E1+v13*3.156489568633434-v19*3.753766352645028)+t3*(v4*7.682215187459476E2+v10*1.675716083756055E2+v16*5.332011136961745E1+v22*5.037720736870209E1);
	edd[4]  = -t2*(v2*8.962202982569892E1+v8*1.372973797627675E1+v14*3.156489568633434-v20*3.753766352645028)+t3*(v5*7.682215187459476E2+v11*1.675716083756055E2+v17*5.332011136961745E1+v23*5.037720736870209E1);
	edd[5]  = -t2*(v3*8.962202982569892E1+v9*1.372973797627675E1+v15*3.156489568633434-v21*3.753766352645028)+t3*(v6*7.682215187459476E2+v12*1.675716083756055E2+v18*5.332011136961745E1+v24*5.037720736870209E1);
	edd[6]  = v1*1.128494603150387+v7*1.881383729356573-v13*1.568328311529807E-1+v19*2.367748579274572E-1-t2*(v4*1.372973797627675E1+v10*1.878027384721004-v16*3.151912735039475-v22*3.156489568633434);
	edd[7]  = v2*1.128494603150387+v8*1.881383729356573-v14*1.568328311529807E-1+v20*2.367748579274572E-1-t2*(v5*1.372973797627675E1+v11*1.878027384721004-v17*3.151912735039475-v23*3.156489568633434);
	edd[8]  = v3*1.128494603150387+v9*1.881383729356573-v15*1.568328311529807E-1+v21*2.367748579274572E-1-t2*(v6*1.372973797627675E1+v12*1.878027384721004-v18*3.151912735039475-v24*3.156489568633434);
	edd[9]  = -t2*(v1*1.296235554368969E1+v7*1.878027384721004+v13*3.151912735039475-v19*3.980319615545978)+t3*(v4*1.675716083756055E2+v10*1.202334185132919E2+v16*5.556275983065716E1+v22*5.332011136961745E1);
	edd[10] = -t2*(v2*1.296235554368969E1+v8*1.878027384721004+v14*3.151912735039475-v20*3.980319615545978)+t3*(v5*1.675716083756055E2+v11*1.202334185132919E2+v17*5.556275983065716E1+v23*5.332011136961745E1);
	edd[11] = -t2*(v3*1.296235554368969E1+v9*1.878027384721004+v15*3.151912735039475-v21*3.980319615545978)+t3*(v6*1.675716083756055E2+v12*1.202334185132919E2+v18*5.556275983065716E1+v24*5.332011136961745E1);
	edd[12] = v1*2.367748579274572E-1-v7*1.568328311529807E-1+v13*1.881383729356573+v19*1.128494603150387-t2*(v4*3.156489568633434+v10*3.151912735039475-v16*1.878027384721004-v22*1.372973797627675E1);
	edd[13] = v2*2.367748579274572E-1-v8*1.568328311529807E-1+v14*1.881383729356573+v20*1.128494603150387-t2*(v5*3.156489568633434+v11*3.151912735039475-v17*1.878027384721004-v23*1.372973797627675E1);
	edd[14] = v3*2.367748579274572E-1-v9*1.568328311529807E-1+v15*1.881383729356573+v21*1.128494603150387-t2*(v6*3.156489568633434+v12*3.151912735039475-v18*1.878027384721004-v24*1.372973797627675E1);
	edd[15] = t2*(v1*(-3.980319615545978)+v7*3.151912735039475+v13*1.878027384721004+v19*1.296235554368969E1)+t3*(v4*5.332011136961745E1+v10*5.556275983065716E1+v16*1.202334185132919E2+v22*1.675716083756055E2);
	edd[16] = t2*(v2*(-3.980319615545978)+v8*3.151912735039475+v14*1.878027384721004+v20*1.296235554368969E1)+t3*(v5*5.332011136961745E1+v11*5.556275983065716E1+v17*1.202334185132919E2+v23*1.675716083756055E2);
	edd[17] = t2*(v3*(-3.980319615545978)+v9*3.151912735039475+v15*1.878027384721004+v21*1.296235554368969E1)+t3*(v6*5.332011136961745E1+v12*5.556275983065716E1+v18*1.202334185132919E2+v24*1.675716083756055E2);
	edd[18] = v1*(-2.796445325908692E-1)+v7*2.367748579274572E-1+v13*1.128494603150387+v19*1.386048285594416E1+t2*(v4*3.753766352645028+v10*3.980319615545978+v16*1.296235554368969E1+v22*8.962202982569892E1);
	edd[19] = v2*(-2.796445325908692E-1)+v8*2.367748579274572E-1+v14*1.128494603150387+v20*1.386048285594416E1+t2*(v5*3.753766352645028+v11*3.980319615545978+v17*1.296235554368969E1+v23*8.962202982569892E1);
	edd[20] = v3*(-2.796445325908692E-1)+v9*2.367748579274572E-1+v15*1.128494603150387+v21*1.386048285594416E1+t2*(v6*3.753766352645028+v12*3.980319615545978+v18*1.296235554368969E1+v24*8.962202982569892E1);
	edd[21] = t2*(v1*(-3.753766352645028)+v7*3.156489568633434+v13*1.372973797627675E1+v19*8.962202982569892E1)+t3*(v4*5.037720736870209E1+v10*5.332011136961745E1+v16*1.675716083756055E2+v22*7.682215187459476E2);
	edd[22] = t2*(v2*(-3.753766352645028)+v8*3.156489568633434+v14*1.372973797627675E1+v20*8.962202982569892E1)+t3*(v5*5.037720736870209E1+v11*5.332011136961745E1+v17*1.675716083756055E2+v23*7.682215187459476E2);
	edd[23] = t2*(v3*(-3.753766352645028)+v9*3.156489568633434+v15*1.372973797627675E1+v21*8.962202982569892E1)+t3*(v6*5.037720736870209E1+v12*5.332011136961745E1+v18*1.675716083756055E2+v24*7.682215187459476E2);
}



// Same as above, but for a "noodle" made up of 4 ANCF beam elements
// In this case, 'v' and 'edd' are of length (4+1)*6 = 30
//
void minv_vec_4(real_* edd, real_* v, real_ le)
{
	real_ v1  = v[0];
	real_ v2  = v[1];
	real_ v3  = v[2];
	real_ v4  = v[3];
	real_ v5  = v[4];
	real_ v6  = v[5];
	real_ v7  = v[6];
	real_ v8  = v[7];
	real_ v9  = v[8];
	real_ v10 = v[9];
	real_ v11 = v[10];
	real_ v12 = v[11];
	real_ v13 = v[12];
	real_ v14 = v[13];
	real_ v15 = v[14];
	real_ v16 = v[15];
	real_ v17 = v[16];
	real_ v18 = v[17];
	real_ v19 = v[18];
	real_ v20 = v[19];
	real_ v21 = v[20];
	real_ v22 = v[21];
	real_ v23 = v[22];
	real_ v24 = v[23];
	real_ v25 = v[24];
	real_ v26 = v[25];
	real_ v27 = v[26];
	real_ v28 = v[27];
	real_ v29 = v[28];
	real_ v30 = v[29];


	real_ t2 = 1.0/le;
	real_ t3 = 1.0/(le*le);

	real_ t4 = v16*8.0937E4;
	real_ t5 = v17*8.0937E4;
	real_ t6 = v18*8.0937E4;
	real_ t7 = v13*3.742911153119093;
	real_ t8 = v16*4.848214285714286E1;
	real_ t9 = v14*3.742911153119093;
	real_ t10 = v17*4.848214285714286E1;
	real_ t11 = v15*3.742911153119093;
	real_ t12 = v18*4.848214285714286E1;
	real_ t13 = v13*2.783553875236295E-1;
	real_ t14 = v16*1.03155E5;
	real_ t15 = v14*2.783553875236295E-1;
	real_ t16 = v17*1.03155E5;
	real_ t17 = v15*2.783553875236295E-1;
	real_ t18 = v18*1.03155E5;
	real_ t19 = v13*3.714555765595463;
	real_ t20 = v16*4.663392857142857E1;
	real_ t21 = v14*3.714555765595463;
	real_ t22 = v17*4.663392857142857E1;
	real_ t23 = v15*3.714555765595463;
	real_ t24 = v18*4.663392857142857E1;

	edd[0]  = t13+v1*1.384944639481501E1+v7*1.137793680799352+v19*6.636510937078045E-2-v25*7.912503375641372E-2-t2*(t14+v4*2.650575E6+v10*3.7935E5+v22*3.327E4+v28*3.1455E4)*3.375641371860654E-5;
	edd[1]  = t15+v2*1.384944639481501E1+v8*1.137793680799352+v20*6.636510937078045E-2-v26*7.912503375641372E-2-t2*(t16+v5*2.650575E6+v11*3.7935E5+v23*3.327E4+v29*3.1455E4)*3.375641371860654E-5;
	edd[2]  = t17+v3*1.384944639481501E1+v9*1.137793680799352+v21*6.636510937078045E-2-v27*7.912503375641372E-2-t2*(t18+v6*2.650575E6+v12*3.7935E5+v24*3.327E4+v30*3.1455E4)*3.375641371860654E-5;
	edd[3]  = -t2*(t19+v1*8.947390629219552E1+v7*1.385454361328652E1+v19*8.902578990008102E-1-v25*1.061807993518769)+t3*(t20+v4*7.662335099918985E2+v10*1.654663448555225E2+v22*1.506936943019174E1+v28*1.42486328652444E1);
	edd[4]  = -t2*(t21+v2*8.947390629219552E1+v8*1.385454361328652E1+v20*8.902578990008102E-1-v26*1.061807993518769)+t3*(t22+v5*7.662335099918985E2+v11*1.654663448555225E2+v23*1.506936943019174E1+v29*1.42486328652444E1);
	edd[5]  = -t2*(t23+v3*8.947390629219552E1+v9*1.385454361328652E1+v21*8.902578990008102E-1-v27*1.061807993518769)+t3*(t24+v6*7.662335099918985E2+v12*1.654663448555225E2+v24*1.506936943019174E1+v30*1.42486328652444E1);
	edd[6]  = v1*1.137793680799352+v7*1.8735484742101-v13*1.918714555765595E-1-v19*5.502295436132865E-2+v25*6.636510937078045E-2+t2*(t4-v4*4.10427E5-v10*5.955E4+v22*2.781E4+v28*2.6373E4)*3.375641371860654E-5;
	edd[7]  = v2*1.137793680799352+v8*1.8735484742101-v14*1.918714555765595E-1-v20*5.502295436132865E-2+v26*6.636510937078045E-2+t2*(t5-v5*4.10427E5-v11*5.955E4+v23*2.781E4+v29*2.6373E4)*3.375641371860654E-5;
	edd[8]  = v3*1.137793680799352+v9*1.8735484742101-v15*1.918714555765595E-1-v21*5.502295436132865E-2+v27*6.636510937078045E-2+t2*(t6-v6*4.10427E5-v12*5.955E4+v24*2.781E4+v30*2.6373E4)*3.375641371860654E-5;
	edd[9]  = -t2*(t7+v1*1.280549554415339E1+v7*2.010194436943019+v19*9.387658655144477E-1-v25*1.123075884418039)+t3*(t8+v4*1.654663448555225E2+v10*1.180039832568188E2+v22*1.592458817175263E1+v28*1.506936943019174E1);
	edd[10] = -t2*(t9+v2*1.280549554415339E1+v8*2.010194436943019+v20*9.387658655144477E-1-v26*1.123075884418039)+t3*(t10+v5*1.654663448555225E2+v11*1.180039832568188E2+v23*1.592458817175263E1+v29*1.506936943019174E1);
	edd[11] = -t2*(t11+v3*1.280549554415339E1+v9*2.010194436943019+v21*9.387658655144477E-1-v27*1.123075884418039)+t3*(t12+v6*1.654663448555225E2+v12*1.180039832568188E2+v24*1.592458817175263E1+v30*1.506936943019174E1);
	edd[12] = v1*2.783553875236295E-1-v7*1.918714555765595E-1+v13*1.724480151228733-v19*1.918714555765595E-1+v25*2.783553875236295E-1-t2*(v4*1.965E3+v10*1.98E3-v22*1.98E3-v28*1.965E3)*(1.0/5.29E2);
	edd[13] = v2*2.783553875236295E-1-v8*1.918714555765595E-1+v14*1.724480151228733-v20*1.918714555765595E-1+v26*2.783553875236295E-1-t2*(v5*1.965E3+v11*1.98E3-v23*1.98E3-v29*1.965E3)*(1.0/5.29E2);
	edd[14] = v3*2.783553875236295E-1-v9*1.918714555765595E-1+v15*1.724480151228733-v21*1.918714555765595E-1+v27*2.783553875236295E-1-t2*(v6*1.965E3+v12*1.98E3-v24*1.98E3-v30*1.965E3)*(1.0/5.29E2);
	edd[15] = t3*(v4*4.663392857142857E1+v10*4.848214285714286E1+v16*9.774107142857143E1+v22*4.848214285714286E1+v28*4.663392857142857E1)-t2*(v1*(1.95E2/5.6E1)-v7*(1.53E2/5.6E1)+v19*(1.53E2/5.6E1)-v25*(1.95E2/5.6E1));
	edd[16] = t3*(v5*4.663392857142857E1+v11*4.848214285714286E1+v17*9.774107142857143E1+v23*4.848214285714286E1+v29*4.663392857142857E1)-t2*(v2*(1.95E2/5.6E1)-v8*(1.53E2/5.6E1)+v20*(1.53E2/5.6E1)-v26*(1.95E2/5.6E1));
	edd[17] = t3*(v6*4.663392857142857E1+v12*4.848214285714286E1+v18*9.774107142857143E1+v24*4.848214285714286E1+v30*4.663392857142857E1)-t2*(v3*(1.95E2/5.6E1)-v9*(1.53E2/5.6E1)+v21*(1.53E2/5.6E1)-v27*(1.95E2/5.6E1));
	edd[18] = v1*6.636510937078045E-2-v7*5.502295436132865E-2-v13*1.918714555765595E-1+v19*1.8735484742101+v25*1.137793680799352-t2*(t4+v4*2.6373E4+v10*2.781E4-v22*5.955E4-v28*4.10427E5)*3.375641371860654E-5;
	edd[19] = v2*6.636510937078045E-2-v8*5.502295436132865E-2-v14*1.918714555765595E-1+v20*1.8735484742101+v26*1.137793680799352-t2*(t5+v5*2.6373E4+v11*2.781E4-v23*5.955E4-v29*4.10427E5)*3.375641371860654E-5;
	edd[20] = v3*6.636510937078045E-2-v9*5.502295436132865E-2-v15*1.918714555765595E-1+v21*1.8735484742101+v27*1.137793680799352-t2*(t6+v6*2.6373E4+v12*2.781E4-v24*5.955E4-v30*4.10427E5)*3.375641371860654E-5;
	edd[21] = t2*(t7-v1*1.123075884418039+v7*9.387658655144477E-1+v19*2.010194436943019+v25*1.280549554415339E1)+t3*(t8+v4*1.506936943019174E1+v10*1.592458817175263E1+v22*1.180039832568188E2+v28*1.654663448555225E2);
	edd[22] = t2*(t9-v2*1.123075884418039+v8*9.387658655144477E-1+v20*2.010194436943019+v26*1.280549554415339E1)+t3*(t10+v5*1.506936943019174E1+v11*1.592458817175263E1+v23*1.180039832568188E2+v29*1.654663448555225E2);
	edd[23] = t2*(t11-v3*1.123075884418039+v9*9.387658655144477E-1+v21*2.010194436943019+v27*1.280549554415339E1)+t3*(t12+v6*1.506936943019174E1+v12*1.592458817175263E1+v24*1.180039832568188E2+v30*1.654663448555225E2);
	edd[24] = t13-v1*7.912503375641372E-2+v7*6.636510937078045E-2+v19*1.137793680799352+v25*1.384944639481501E1+t2*(t14+v4*3.1455E4+v10*3.327E4+v22*3.7935E5+v28*2.650575E6)*3.375641371860654E-5;
	edd[25] = t15-v2*7.912503375641372E-2+v8*6.636510937078045E-2+v20*1.137793680799352+v26*1.384944639481501E1+t2*(t16+v5*3.1455E4+v11*3.327E4+v23*3.7935E5+v29*2.650575E6)*3.375641371860654E-5;
	edd[26] = t17-v3*7.912503375641372E-2+v9*6.636510937078045E-2+v21*1.137793680799352+v27*1.384944639481501E1+t2*(t18+v6*3.1455E4+v12*3.327E4+v24*3.7935E5+v30*2.650575E6)*3.375641371860654E-5;
	edd[27] = t2*(t19-v1*1.061807993518769+v7*8.902578990008102E-1+v19*1.385454361328652E1+v25*8.947390629219552E1)+t3*(t20+v4*1.42486328652444E1+v10*1.506936943019174E1+v22*1.654663448555225E2+v28*7.662335099918985E2);
	edd[28] = t2*(t21-v2*1.061807993518769+v8*8.902578990008102E-1+v20*1.385454361328652E1+v26*8.947390629219552E1)+t3*(t22+v5*1.42486328652444E1+v11*1.506936943019174E1+v23*1.654663448555225E2+v29*7.662335099918985E2);
	edd[29] = t2*(t23-v3*1.061807993518769+v9*8.902578990008102E-1+v21*1.385454361328652E1+v27*8.947390629219552E1)+t3*(t24+v6*1.42486328652444E1+v12*1.506936943019174E1+v24*1.654663448555225E2+v30*7.662335099918985E2);

}
