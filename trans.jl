const c = 3e8
const c_a = 137.036

const l_t = 0.529177e-10  # m
const e_t = 1.6021e-19  # C
const E_t = 27.2114  # eV
const t_t = 2.4189e-17 # s

const I_n = 5e14
const E0_n = 2.742e3 * sqrt(I_n)
const E0_a = E0_n / 5.1421e11

println("1. 已知omega求波长, 周期")
println("2. 已知波长求omega, 周期")

flags = parse(UInt8, readline())

if flags == 1
    #E_a = 1.84
    println("输入omega:(a.u)")

    # 已知omega求波长, 周期
    E_a = parse(Float64, readline())
    l_n = c_a * 2pi/E_a * l_t
    t_n = l_n/c
    println("when omega(au) = $(E_a) (a.u) = $(E_a*E_t) (eV)")
    println("length = $(l_n) (m)")
    println("cycle = $(t_n) (s), $(t_n/t_t) (a.u.)")
end


if flags == 2
    # 已知波长求omega, 周期
    println("输入波长:(nm)")

    l_n = parse(Float64, readline())
    l_n /= 1e9
    E_a = c_a * 2pi/l_n * l_t
    println("when length = $(l_n) (m)")
    println("omega = $(E_a) (a.u.) = $(E_a*E_t) (eV)")
    println("cycle = $(l_n/c) (s) = $(l_n/c/t_t) (a.u.)")
end
