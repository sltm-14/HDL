library verilog;
use verilog.vl_types.all;
entity dec_to_bin is
    port(
        i_d1            : in     vl_logic;
        i_d2            : in     vl_logic;
        i_d3            : in     vl_logic;
        i_d4            : in     vl_logic;
        i_d5            : in     vl_logic;
        i_d6            : in     vl_logic;
        i_d7            : in     vl_logic;
        o_b             : out    vl_logic_vector(3 downto 0)
    );
end dec_to_bin;
