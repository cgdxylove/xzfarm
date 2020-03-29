package beans.constant;

/**
 * 功能描述：
 *
 * @Author: chengong
 * @Date: 2020/3/22 13:04
 */
public interface SeckillConstant {
    //=============================秒杀用到的key值，对照前后端一致
    public static final String SECKILLID = "seckillId";
    public static final String USERID = "userId";


    //=============================秒杀redis
    public static final String PROSECKILL_ID_ = "seckillId_";//缓存秒杀商品详情的前缀
    public static final String SECKILL_STORENUM_="seckill_storeNum_";//缓存秒杀库存的前缀
    public static final String SECKILL_USER_ = "seckill_user_"; //缓存用户秒杀限制信息的前缀
    //============================= 业务逻辑码
    public static  final String  SECKILL_SUCCESS = "B01001";//秒杀成功
    public static  final String  SECKILL_Fail = "B01002";//秒杀失败
    public static  final String  SECKILL_NO = "B01003";//秒杀结束


}
