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
    xilinxcorelib_ver_m_04284627112054182733_2740722860_init();
    xilinxcorelib_ver_m_18166792875774041790_1724394411_init();
    xilinxcorelib_ver_m_17738287534884592592_1860121655_init();
    xilinxcorelib_ver_m_10066368518302646626_0706566074_init();
    work_m_14056882636803624207_1710177608_init();
    xilinxcorelib_ver_m_17738287534884592592_2869846962_init();
    xilinxcorelib_ver_m_10066368518302646626_0922622078_init();
    work_m_14056882636803624207_4242959602_init();
    xilinxcorelib_ver_m_17738287534884592592_0823472250_init();
    xilinxcorelib_ver_m_10066368518302646626_0586172592_init();
    work_m_14056882636803624207_2346802276_init();
    work_m_06693177236773758814_0920493093_init();
    work_m_16541823861846354283_2073120511_init();


    xsi_register_tops("work_m_06693177236773758814_0920493093");
    xsi_register_tops("work_m_16541823861846354283_2073120511");


    return xsi_run_simulation(argc, argv);

}
