//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace KourseWork.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Аранжировка
    {
        public string Код_услуги { get; set; }
        public string Референс { get; set; }
        public string Жанр { get; set; }
        public Nullable<int> Кол_во_музыкантов { get; set; }
    
        public virtual Перечень_услуг Перечень_услуг { get; set; }
    }
}
