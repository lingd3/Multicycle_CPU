/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000001408144823_4066630463_init();
    work_m_00000000001702986214_1733832700_init();
    work_m_00000000001248663123_0886308060_init();
    work_m_00000000003491713412_0745121918_init();
    work_m_00000000003333709547_2007573001_init();
    work_m_00000000003000312899_2882093864_init();
    work_m_00000000000492767786_1372700234_init();
    work_m_00000000001144727344_3164617958_init();
    work_m_00000000000355002786_0278921292_init();
    work_m_00000000001909881601_3490692879_init();
    work_m_00000000003334631236_4151736924_init();
    work_m_00000000000492767786_2461264495_init();
    work_m_00000000003825722134_3508565487_init();
    work_m_00000000000131695045_1985558087_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000000131695045_1985558087");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}