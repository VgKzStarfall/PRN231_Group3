using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace PRN231.Migrations
{
    /// <inheritdoc />
    public partial class InitialDB : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "interviewer",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    first_name = table.Column<string>(type: "varchar(50)", unicode: false, maxLength: 50, nullable: false),
                    last_name = table.Column<string>(type: "varchar(50)", unicode: false, maxLength: 50, nullable: false),
                    position = table.Column<string>(type: "varchar(25)", unicode: false, maxLength: 25, nullable: false),
                    Email = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Password = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_interviewer", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "jobs",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    created_date = table.Column<DateTime>(type: "datetime", nullable: true),
                    expired_date = table.Column<DateTime>(type: "datetime", nullable: true),
                    job_title = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    min_salary = table.Column<decimal>(type: "decimal(8,2)", nullable: true),
                    max_salary = table.Column<decimal>(type: "decimal(8,2)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__jobs__3213E83F0D65D3F9", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "regions",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    region_name = table.Column<string>(type: "varchar(25)", unicode: false, maxLength: 25, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__regions__3213E83FF388C1A2", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "skills",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    name = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_skills", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "stages",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    name = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    stage_index = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_stages", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "countries",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    country_name = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: true),
                    region_id = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__countrie__7E8CD055782E7D58", x => x.id);
                    table.ForeignKey(
                        name: "FK__countries__regio__286302EC",
                        column: x => x.region_id,
                        principalTable: "regions",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "jobs_skill",
                columns: table => new
                {
                    job_id = table.Column<int>(type: "int", nullable: false),
                    skill_id = table.Column<int>(type: "int", nullable: false),
                    exp_year = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_jobs_skill", x => new { x.job_id, x.skill_id });
                    table.ForeignKey(
                        name: "FK_jobs_skill_jobs_job_id",
                        column: x => x.job_id,
                        principalTable: "jobs",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_jobs_skill_skills",
                        column: x => x.skill_id,
                        principalTable: "skills",
                        principalColumn: "id");
                });

            migrationBuilder.CreateTable(
                name: "locations",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    street_address = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: true),
                    postal_code = table.Column<string>(type: "varchar(12)", unicode: false, maxLength: 12, nullable: true),
                    city = table.Column<string>(type: "varchar(30)", unicode: false, maxLength: 30, nullable: false),
                    state_province = table.Column<string>(type: "varchar(25)", unicode: false, maxLength: 25, nullable: true),
                    country_id = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__location__771831EA07343670", x => x.id);
                    table.ForeignKey(
                        name: "FK__locations__count__2E1BDC42",
                        column: x => x.country_id,
                        principalTable: "countries",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "departments",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    department_name = table.Column<string>(type: "varchar(30)", unicode: false, maxLength: 30, nullable: false),
                    location_id = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__departme__3213E83F88E2573C", x => x.id);
                    table.ForeignKey(
                        name: "FK__departmen__locat__35BCFE0A",
                        column: x => x.location_id,
                        principalTable: "locations",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "candidates",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    first_name = table.Column<string>(type: "varchar(20)", unicode: false, maxLength: 20, nullable: true),
                    last_name = table.Column<string>(type: "varchar(25)", unicode: false, maxLength: 25, nullable: false),
                    email = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    phone_number = table.Column<string>(type: "varchar(20)", unicode: false, maxLength: 20, nullable: true),
                    hire_date = table.Column<DateTime>(type: "date", nullable: true),
                    job_id = table.Column<int>(type: "int", nullable: false),
                    interviewer_id = table.Column<string>(type: "nchar(10)", fixedLength: true, maxLength: 10, nullable: true),
                    salary = table.Column<decimal>(type: "decimal(8,2)", nullable: false),
                    department_id = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__employee__3213E83F50F84446", x => x.id);
                    table.ForeignKey(
                        name: "FK_candidates_departments_department_id",
                        column: x => x.department_id,
                        principalTable: "departments",
                        principalColumn: "id");
                    table.ForeignKey(
                        name: "FK_candidates_jobs_job_id",
                        column: x => x.job_id,
                        principalTable: "jobs",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "interviewer_candidate",
                columns: table => new
                {
                    interviewer_id = table.Column<int>(type: "int", nullable: false),
                    candidate_id = table.Column<int>(type: "int", nullable: false),
                    score = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_interviewer_candidate", x => new { x.interviewer_id, x.candidate_id });
                    table.ForeignKey(
                        name: "FK_interviewer_candidate_candidates_candidate_id",
                        column: x => x.candidate_id,
                        principalTable: "candidates",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_interviewer_candidate_interviewer",
                        column: x => x.interviewer_id,
                        principalTable: "interviewer",
                        principalColumn: "id");
                });

            migrationBuilder.CreateIndex(
                name: "IX_candidates_department_id",
                table: "candidates",
                column: "department_id");

            migrationBuilder.CreateIndex(
                name: "IX_candidates_job_id",
                table: "candidates",
                column: "job_id");

            migrationBuilder.CreateIndex(
                name: "IX_countries_region_id",
                table: "countries",
                column: "region_id");

            migrationBuilder.CreateIndex(
                name: "IX_departments_location_id",
                table: "departments",
                column: "location_id");

            migrationBuilder.CreateIndex(
                name: "IX_interviewer_candidate_candidate_id",
                table: "interviewer_candidate",
                column: "candidate_id");

            migrationBuilder.CreateIndex(
                name: "IX_jobs_skill_skill_id",
                table: "jobs_skill",
                column: "skill_id");

            migrationBuilder.CreateIndex(
                name: "IX_locations_country_id",
                table: "locations",
                column: "country_id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "interviewer_candidate");

            migrationBuilder.DropTable(
                name: "jobs_skill");

            migrationBuilder.DropTable(
                name: "stages");

            migrationBuilder.DropTable(
                name: "candidates");

            migrationBuilder.DropTable(
                name: "interviewer");

            migrationBuilder.DropTable(
                name: "skills");

            migrationBuilder.DropTable(
                name: "departments");

            migrationBuilder.DropTable(
                name: "jobs");

            migrationBuilder.DropTable(
                name: "locations");

            migrationBuilder.DropTable(
                name: "countries");

            migrationBuilder.DropTable(
                name: "regions");
        }
    }
}
