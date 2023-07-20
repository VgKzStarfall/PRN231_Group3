using PRN231.Entities;
using System.ComponentModel;

namespace PRN231.DTOs.RequestModels
{
    public class Pager
    {
        ///
        public int PageSize { get; set; }
        ///
        public int PageIndex { get; set; }
        ///
        [DefaultValue("ID")]
        public string? SortBy { get; set; } = "ID";
        ///
        [DefaultValue("desc")]
        public string? OrderBy { get; set; } = "desc";
        [DefaultValue("")]
        public string? Keyword { get; set; } = "";
    }
    public class JobRequest
    {
        public Job? job { get; set; }
        public string? listSkills { get; set; }
    }
}
