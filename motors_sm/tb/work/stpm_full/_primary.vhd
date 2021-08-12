library verilog;
use verilog.vl_types.all;
entity stpm_full is
    port(
        i_Clk           : in     vl_logic;
        i_Rst           : in     vl_logic;
        i_Dir           : in     vl_logic;
        i_En            : in     vl_logic_vector(3 downto 0);
        i_Cycles        : in     vl_logic_vector(9 downto 0);
        o_Pwm_a         : out    vl_logic_vector(3 downto 0);
        o_Pwm_b         : out    vl_logic_vector(3 downto 0);
        o_Pwm_c         : out    vl_logic_vector(3 downto 0);
        o_Pwm_d         : out    vl_logic_vector(3 downto 0)
    );
end stpm_full;
