select  a.DWMC,a.DWGM 单位表规模,b.GMXQ 规模代码表规模,
        a.DWXZ 单位表性质,c.DWXZ 性质表性质,
        a.DWHY 单位表行业 ,d.HYMC 行业表行业
from DATA_DWDMK a
         left join DWGMK b on a.DWGMDM=b.GMDM
         left join DWXZK c on a.DWXZDM=c.DWXZDM
         left join DWHYDMK d on a.DWHYDM=d.HYDM