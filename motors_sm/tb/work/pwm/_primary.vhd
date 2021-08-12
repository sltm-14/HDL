library verilog;
use verilog.vl_types.all;
entity pwm is
    generic(
        TOTAL_BITS      : integer := 8;
        POL             : integer := 1
    );
    port(
        iClk            : in     vl_logic;
        iCE             : in     vl_logic;
        iRst            : in     vl_logic;
        ivDutyCycle     : in     vl_logic_vector;
        oPWM            : out    vl_logic;
        oCycleStart     : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of TOTAL_BITS : constant is 1;
    attribute mti_svvh_generic_type of POL : constant is 1;
end pwm;
