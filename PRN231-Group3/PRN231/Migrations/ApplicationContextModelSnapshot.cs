﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using PRN231.Entities;

#nullable disable

namespace PRN231.Migrations
{
    [DbContext(typeof(ApplicationContext))]
    partial class ApplicationContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "7.0.4")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder);

            modelBuilder.Entity("PRN231.Entities.Candidate", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("id");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<int?>("DepartmentId")
                        .HasColumnType("int")
                        .HasColumnName("department_id");

                    b.Property<string>("Email")
                        .IsRequired()
                        .HasMaxLength(100)
                        .IsUnicode(false)
                        .HasColumnType("varchar(100)")
                        .HasColumnName("email");

                    b.Property<string>("FirstName")
                        .HasMaxLength(20)
                        .IsUnicode(false)
                        .HasColumnType("varchar(20)")
                        .HasColumnName("first_name");

                    b.Property<DateTime?>("HireDate")
                        .HasColumnType("date")
                        .HasColumnName("hire_date");

                    b.Property<string>("InterviewerId")
                        .HasMaxLength(10)
                        .HasColumnType("nchar(10)")
                        .HasColumnName("interviewer_id")
                        .IsFixedLength();

                    b.Property<int>("JobId")
                        .HasColumnType("int")
                        .HasColumnName("job_id");

                    b.Property<string>("LastName")
                        .IsRequired()
                        .HasMaxLength(25)
                        .IsUnicode(false)
                        .HasColumnType("varchar(25)")
                        .HasColumnName("last_name");

                    b.Property<string>("PhoneNumber")
                        .HasMaxLength(20)
                        .IsUnicode(false)
                        .HasColumnType("varchar(20)")
                        .HasColumnName("phone_number");

                    b.Property<decimal>("Salary")
                        .HasColumnType("decimal(8, 2)")
                        .HasColumnName("salary");

                    b.HasKey("Id")
                        .HasName("PK__employee__3213E83F50F84446");

                    b.HasIndex("DepartmentId");

                    b.HasIndex("JobId");

                    b.ToTable("candidates", (string)null);
                });

            modelBuilder.Entity("PRN231.Entities.Country", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("id");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<string>("CountryName")
                        .HasMaxLength(40)
                        .IsUnicode(false)
                        .HasColumnType("varchar(40)")
                        .HasColumnName("country_name");

                    b.Property<int>("RegionId")
                        .HasColumnType("int")
                        .HasColumnName("region_id");

                    b.HasKey("Id")
                        .HasName("PK__countrie__7E8CD055782E7D58");

                    b.HasIndex("RegionId");

                    b.ToTable("countries", (string)null);
                });

            modelBuilder.Entity("PRN231.Entities.Department", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("id");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<string>("DepartmentName")
                        .IsRequired()
                        .HasMaxLength(30)
                        .IsUnicode(false)
                        .HasColumnType("varchar(30)")
                        .HasColumnName("department_name");

                    b.Property<int?>("LocationId")
                        .HasColumnType("int")
                        .HasColumnName("location_id");

                    b.HasKey("Id")
                        .HasName("PK__departme__3213E83F88E2573C");

                    b.HasIndex("LocationId");

                    b.ToTable("departments", (string)null);
                });

            modelBuilder.Entity("PRN231.Entities.Interviewer", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("id");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<string>("Email")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("FirstName")
                        .IsRequired()
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)")
                        .HasColumnName("first_name");

                    b.Property<string>("LastName")
                        .IsRequired()
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)")
                        .HasColumnName("last_name");

                    b.Property<string>("Password")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Position")
                        .IsRequired()
                        .HasMaxLength(25)
                        .IsUnicode(false)
                        .HasColumnType("varchar(25)")
                        .HasColumnName("position");

                    b.HasKey("Id");

                    b.ToTable("interviewer", (string)null);
                });

            modelBuilder.Entity("PRN231.Entities.InterviewerCandidate", b =>
                {
                    b.Property<int>("InterviewerId")
                        .HasColumnType("int")
                        .HasColumnName("interviewer_id");

                    b.Property<int>("CandidateId")
                        .HasColumnType("int")
                        .HasColumnName("candidate_id");

                    b.Property<int>("Score")
                        .HasColumnType("int")
                        .HasColumnName("score");

                    b.HasKey("InterviewerId", "CandidateId");

                    b.HasIndex("CandidateId");

                    b.ToTable("interviewer_candidate", (string)null);
                });

            modelBuilder.Entity("PRN231.Entities.Job", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("id");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<DateTime?>("CreatedDate")
                        .HasColumnType("datetime")
                        .HasColumnName("created_date");

                    b.Property<DateTime?>("ExpiredDate")
                        .HasColumnType("datetime")
                        .HasColumnName("expired_date");

                    b.Property<string>("JobTitle")
                        .IsRequired()
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)")
                        .HasColumnName("job_title");

                    b.Property<decimal?>("MaxSalary")
                        .HasColumnType("decimal(8, 2)")
                        .HasColumnName("max_salary");

                    b.Property<decimal?>("MinSalary")
                        .HasColumnType("decimal(8, 2)")
                        .HasColumnName("min_salary");

                    b.HasKey("Id")
                        .HasName("PK__jobs__3213E83F0D65D3F9");

                    b.ToTable("jobs", (string)null);
                });

            modelBuilder.Entity("PRN231.Entities.JobsSkill", b =>
                {
                    b.Property<int>("JobId")
                        .HasColumnType("int")
                        .HasColumnName("job_id");

                    b.Property<int>("SkillId")
                        .HasColumnType("int")
                        .HasColumnName("skill_id");

                    b.Property<int?>("ExpYear")
                        .HasColumnType("int")
                        .HasColumnName("exp_year");

                    b.HasKey("JobId", "SkillId");

                    b.HasIndex("SkillId");

                    b.ToTable("jobs_skill", (string)null);
                });

            modelBuilder.Entity("PRN231.Entities.Location", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("id");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<string>("City")
                        .IsRequired()
                        .HasMaxLength(30)
                        .IsUnicode(false)
                        .HasColumnType("varchar(30)")
                        .HasColumnName("city");

                    b.Property<int>("CountryId")
                        .HasColumnType("int")
                        .HasColumnName("country_id");

                    b.Property<string>("PostalCode")
                        .HasMaxLength(12)
                        .IsUnicode(false)
                        .HasColumnType("varchar(12)")
                        .HasColumnName("postal_code");

                    b.Property<string>("StateProvince")
                        .HasMaxLength(25)
                        .IsUnicode(false)
                        .HasColumnType("varchar(25)")
                        .HasColumnName("state_province");

                    b.Property<string>("StreetAddress")
                        .HasMaxLength(40)
                        .IsUnicode(false)
                        .HasColumnType("varchar(40)")
                        .HasColumnName("street_address");

                    b.HasKey("Id")
                        .HasName("PK__location__771831EA07343670");

                    b.HasIndex("CountryId");

                    b.ToTable("locations", (string)null);
                });

            modelBuilder.Entity("PRN231.Entities.Region", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("id");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<string>("RegionName")
                        .HasMaxLength(25)
                        .IsUnicode(false)
                        .HasColumnType("varchar(25)")
                        .HasColumnName("region_name");

                    b.HasKey("Id")
                        .HasName("PK__regions__3213E83FF388C1A2");

                    b.ToTable("regions", (string)null);
                });

            modelBuilder.Entity("PRN231.Entities.Skill", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("id");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)")
                        .HasColumnName("name");

                    b.HasKey("Id");

                    b.ToTable("skills", (string)null);
                });

            modelBuilder.Entity("PRN231.Entities.Stage", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("id");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)")
                        .HasColumnName("name");

                    b.Property<int>("StageIndex")
                        .HasColumnType("int")
                        .HasColumnName("stage_index");

                    b.HasKey("Id");

                    b.ToTable("stages", (string)null);
                });

            modelBuilder.Entity("PRN231.Entities.Candidate", b =>
                {
                    b.HasOne("PRN231.Entities.Department", "Department")
                        .WithMany("Candidates")
                        .HasForeignKey("DepartmentId");

                    b.HasOne("PRN231.Entities.Job", null)
                        .WithMany("Candidates")
                        .HasForeignKey("JobId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Department");
                });

            modelBuilder.Entity("PRN231.Entities.Country", b =>
                {
                    b.HasOne("PRN231.Entities.Region", "Region")
                        .WithMany("Countries")
                        .HasForeignKey("RegionId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired()
                        .HasConstraintName("FK__countries__regio__286302EC");

                    b.Navigation("Region");
                });

            modelBuilder.Entity("PRN231.Entities.Department", b =>
                {
                    b.HasOne("PRN231.Entities.Location", "Location")
                        .WithMany("Departments")
                        .HasForeignKey("LocationId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .HasConstraintName("FK__departmen__locat__35BCFE0A");

                    b.Navigation("Location");
                });

            modelBuilder.Entity("PRN231.Entities.InterviewerCandidate", b =>
                {
                    b.HasOne("PRN231.Entities.Candidate", "Candidate")
                        .WithMany()
                        .HasForeignKey("CandidateId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("PRN231.Entities.Interviewer", "Interviewer")
                        .WithMany("InterviewerCandidates")
                        .HasForeignKey("InterviewerId")
                        .IsRequired()
                        .HasConstraintName("FK_interviewer_candidate_interviewer");

                    b.Navigation("Candidate");

                    b.Navigation("Interviewer");
                });

            modelBuilder.Entity("PRN231.Entities.JobsSkill", b =>
                {
                    b.HasOne("PRN231.Entities.Job", "Job")
                        .WithMany()
                        .HasForeignKey("JobId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("PRN231.Entities.Skill", "Skill")
                        .WithMany("JobsSkills")
                        .HasForeignKey("SkillId")
                        .IsRequired()
                        .HasConstraintName("FK_jobs_skill_skills");

                    b.Navigation("Job");

                    b.Navigation("Skill");
                });

            modelBuilder.Entity("PRN231.Entities.Location", b =>
                {
                    b.HasOne("PRN231.Entities.Country", "Country")
                        .WithMany("Locations")
                        .HasForeignKey("CountryId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired()
                        .HasConstraintName("FK__locations__count__2E1BDC42");

                    b.Navigation("Country");
                });

            modelBuilder.Entity("PRN231.Entities.Country", b =>
                {
                    b.Navigation("Locations");
                });

            modelBuilder.Entity("PRN231.Entities.Department", b =>
                {
                    b.Navigation("Candidates");
                });

            modelBuilder.Entity("PRN231.Entities.Interviewer", b =>
                {
                    b.Navigation("InterviewerCandidates");
                });

            modelBuilder.Entity("PRN231.Entities.Job", b =>
                {
                    b.Navigation("Candidates");
                });

            modelBuilder.Entity("PRN231.Entities.Location", b =>
                {
                    b.Navigation("Departments");
                });

            modelBuilder.Entity("PRN231.Entities.Region", b =>
                {
                    b.Navigation("Countries");
                });

            modelBuilder.Entity("PRN231.Entities.Skill", b =>
                {
                    b.Navigation("JobsSkills");
                });
#pragma warning restore 612, 618
        }
    }
}
