select * from
aluno, curso
where aluno.idCurso = curso.id

select * from
aluno, disciplina, matricula
where aluno.id = matricula.idAluno and
discplina.id = matricula.idDisciplina;

select * from viewAlunoCurso;
select * from viewAlunoDisciplinaMatricula;

